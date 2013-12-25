class User < ActiveRecord::Base
  has_merit

  has_many :timelines, dependent: :destroy do
    def page(limit=20, offset=0)
      all(:limit=> limit, :offset=>offset)
    end
  end
  has_many :ratings, dependent: :destroy
  has_many :trackers, dependent: :destroy
  has_many :discounts, dependent: :destroy
  
  before_create :set_defaults
  after_create { |timeline| Timeline.create! user_id: self.id, nature: "create" }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :username, :email, presence: true
  validates_uniqueness_of :username
  validates :username, format: { with: /\A[a-zA-Z\d\w-]+\z/, message: "Only letters, numbers, underscores, and dashes allowed" }
  validates :username, length: {
      minimum: 3,
      maximum: 30,
      too_short: "must have at least %{count} letters",
      too_long: "can have at most %{count} letters"
    }
    
    validates :username, format: { without: /(player1|admin|help|fuck|shit|damn|crap|piss|dick|cock|pussy|ass|fag|bastard|slut|douche|bitch)/i,
        message: "is reserved" }
        
  def to_param
    [id, username.parameterize].join("-")
  end
  
  def set_defaults
    self.has_membership = false if self.has_membership.blank?
    self.lifetime_points = 0 if self.lifetime_points.blank?
    self.used_points = 0 if self.used_points.blank?
  end
end
