class Category < ActiveRecord::Base
  has_many :drinks, dependent: :destroy
  has_many :games, dependent: :destroy
  
  validates :name, :description, :visible, :area, presence: true
  

  def to_param
    [id, name.parameterize].join("-")
  end

end
