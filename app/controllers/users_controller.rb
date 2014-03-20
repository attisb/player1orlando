class UsersController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @users = User.text_search(params[:query])
    else
      @users = User.all
    end
    @admins = Admin.all
  end
  
  def show
  end
  
  def edit
    
    unless @user.emp_code.blank?
      @employee_issued = Tracker.where(issued_by: @user.emp_code).where("date(created_at) > ?", 15.days.ago).group("date(created_at)").count
    end
    
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if admin_signed_in?
        params.require(:user).permit(:first_name, :last_name, :email, :username, :emp_code, :has_membership, :lifetime_points, :used_points, :membership_number)
      else
        params.require(:user).permit(:first_name, :last_name, :email, :username, :membership_number)
      end
    end
  
end
