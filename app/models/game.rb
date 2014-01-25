class Game < ActiveRecord::Base
  belongs_to :category
  has_many :ratings, dependent: :destroy
  
  validates :name, :description, :released_at, :publisher, :players, :category_id, presence: true
  
  mount_uploader :cover_art, CoverArtUploader
  
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
      where("name @@ :q or publisher @@ :q", q: query)
    else
      scoped
    end
  end
  
end
