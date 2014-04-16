class Drink < ActiveRecord::Base
  belongs_to :category
  belongs_to :beer_style
  has_many :timelines, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :trackers, dependent: :destroy
  
  validates :name, :brewery, :description, :price, :beer_style_id, :category_id, presence: true
  
  mount_uploader :drink_image, DrinkImageUploader
  mount_uploader :image_tv, TvgraphicUploader

  BEER_STYLES = [
    "amber ale",
    "barleywine",
    "belgian dark ale",
    "belgian dubbel",
    "belgian pale ale",
    "belgian strong dark",
    "belgian strong pale",
    "belgian trippel",
    "brown ale",
    "hefeweizen",
    "ipa",
    "lambic",
    "pale ale",
    "pilsner-lager",
    "porter-stout",
    "saison-farmhouse ale",
    "wheat beer-witbier-witte"
  ]
  
  DISPENSE_TYPE = [
    "can",
    "bottle",
    "draft"
  ]
  
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
