class Game < ActiveRecord::Base
  belongs_to :category
  has_many :ratings, dependent: :destroy
  
  validates :name, :description, :released_at, :developer, :publisher, :players, :visible, :category_id, presence: true
  
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
  
end
