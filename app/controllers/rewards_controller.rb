class RewardsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_user!, only: [:issue, :redeem, :post_redeem]
  before_action :set_reward, only: [:show, :edit, :update, :destroy, :issue]
  
  layout :resolve_layout

  def index
    @user_rewards = nil
    
    unless admin_signed_in?
      @user = current_user
      if @user.nil?
        redirect_to new_user_session_path
      else
        @user_rewards = Discount.where(:used => false, :user_id => @user)
      end
    end

    @rewards = Reward.where(:visible => true).order(points: :asc)
    @inactive_rewards = Reward.where(:visible => false).order(points: :asc)
  end

  def new
    @reward = Reward.new(:visible => true, :points => 10)
  end

  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to rewards_path, notice: 'Reward was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to rewards_path, notice: 'Reward was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
  
  
  def issue
    @user = current_user
    
    # unless citizen_allowed?
    #   redirect_to rewards_path, alert: "Sorry can't earn points on select days. This is one of them"
    # else
      if (@user.lifetime_points - @user.used_points) >= @reward.points && @user.has_membership?
        discount = Discount.create(
          :reward_id => @reward.id,
          :used => false,
          :user_id => @user.id,
          :points => @reward.points
        )
        new_point_balance = @user.used_points + @reward.points
      
        @user.update(:used_points => new_point_balance)
      
        redirect_to rewards_path, notice: "Cool you were issed this reward. To use it just tell us the code (#{sprintf('%06d', discount.code)}) or have your friend tell us the code."
      else
        redirect_to rewards_path, alert: 'Sorry you don\'t have enough points for that reward or your not a citizen yet.'
      end
    # end
    
  end
  
  def redeem
    unless current_user.emp_code.blank?
    else
      redirect_to rewards_path
    end
  end
  
  def post_redeem
    if current_user.emp_code.blank?
      redirect_to rewards_path
    else
      @discount = Discount.where(:code => params[:code]).first
      if @discount.nil?
        redirect_to redeem_reward_path, alert: "Not a valid code."
      else
        @discount.update(:used => true)
        redirect_to redeem_reward_path, notice: "Success: Redeemed '#{@discount.reward.name}'. "
      end
    end
  end
  
  def post_user_redeem
    @discount = Discount.where(:code => params[:code], :user_id => params[:user_id]).first
    if @discount.nil?
      redirect_to user_redeem_path(params[:code], params[:user_id]), alert: "Not a valid code."
    else
      @discount.update(:used => true)
      redirect_to root_path, notice: "Success: Redeemed '#{@discount.reward.name}'. "
    end
  end
  
  def user_redeem
    @discount = Discount.where(:code => params[:code], :user_id => params[:user_id]).first
    if @discount.nil?
      redirect_to redeem_reward_path, alert: "Not a valid code."
    end
  end
  
  def post_citizen_checkin
    if current_user.emp_code.blank? || !params[:from_user].present?
      redirect_to rewards_path
    else
      @user = User.find(params[:code])
      if @user.nil?
        redirect_to redeem_reward_path, alert: "Not a valid user code."
      else
        if @user.has_membership?
          timeline = Timeline.create(
            :user_id => @user.id,
            :nature => "checkin"
          )
          
          user_visit_count = @user.timelines.where(:nature => "checkin").count
          
          if user_visit_count == 10
            @user.add_badge(8)
          elsif user_visit_count == 20
            @user.add_badge(9)
          elsif user_visit_count == 50
            @user.add_badge(10)
          elsif user_visit_count == 100
            @user.add_badge(11)
          elsif user_visit_count == 200
            @user.add_badge(12)
          elsif user_visit_count == 500
            @user.add_badge(13)
          end
          
          if params[:from_user].present?
            redirect_to citizen_checkin_path, notice: "Success: Valid Checkin '#{@user.first_name}'. "
          else
            redirect_to redeem_reward_path, notice: "Success: Valid Checkin '#{@user.first_name}'. "
          end
        else
          redirect_to redeem_reward_path, alert: "Not a valid citizen."
        end
      end
    end
  end
  
  private
    def set_reward
      @reward = Reward.find(params[:id])
    end

    def reward_params
      params.require(:reward).permit(:name, :description, :points, :visible)
    end
    
  def resolve_layout
    case action_name
    when "redeem"
      "redeem_app"
    else
      "application"
    end
  end
  
end
