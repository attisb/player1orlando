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
    "New Draft Drink" => "new-draft",
    "New Craft Bottle & Can Drink" => "new-bottle",
    "New Other Type of Drink" => "new-other",
    "Existing Drink" => "4"
  }
  
  DISPENSE_TYPE = {
    "Draft" => "draft",
    "Craft Bottle & Cans" => "bottles-cans",
    "Bombers" => "bombers",
    "Mixed Drink" => "mixed-drinks",
    "Non-Alcoholic" => "non-alcoholic",
    "Energy Drinks" => "energy-drinks",
    "Meads & Sake" => "meads-sakes",
    "Wines & Ciders" => "wines-ciders"
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
