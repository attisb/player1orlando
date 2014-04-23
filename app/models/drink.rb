class Drink < ActiveRecord::Base
  belongs_to :category
  belongs_to :beer_style
  has_many :timelines, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :trackers, dependent: :destroy
  
  validates :name, :brewery, :description, :price, :beer_style_id, :category_id, presence: true
  
  mount_uploader :drink_image, DrinkImageUploader
  mount_uploader :image_tv, TvgraphicUploader

  UPDATE_STYLES = {
    "New Draft Drink" => "1",
    "New Craft Bottle & Can Drink" => "2",
    "New Other Type of Drink" => "3",
    "Existing Drink" => "4"
  }
  
  DISPENSE_TYPE = {
    "Draft" => "1",
    "Craft Bottle & Cans" => "2",
    "Mixed Drink" => "3",
    "Non-Alcoholic" => "4",
    "Energy Drinks" => "5",
    "Meads & Sake" => "6",
    "Wines & Ciders" => "7"
  }
  
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
  
  def self.text_search(query)
    if query.present?
      where("name @@ :q or brewery @@ :q", q: query)
    else
      scoped
    end
  end
  
end
