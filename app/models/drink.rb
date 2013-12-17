class Drink < ActiveRecord::Base
  belongs_to :category
  belongs_to :beer_style
  has_many :timelines, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :trackers, dependent: :destroy
  
  validates :name, :brewery, :description, :price, :beer_style_id, :category_id, presence: true
  
  mount_uploader :drink_image, DrinkImageUploader

  def to_param
    [id, name.parameterize].join("-")
  end
  
  def average_rating
    if ratings.size == 0
      0
    else
      ratings.sum(:rating) / ratings.size
    end
  end
  
end
