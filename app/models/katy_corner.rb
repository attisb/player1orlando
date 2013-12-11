class KatyCorner < ActiveRecord::Base

  validates :title, :brief, :body_document, presence: true

  mount_uploader :image1, KatyImagesUploader
  mount_uploader :image2, KatyImagesUploader
  mount_uploader :image3, KatyImagesUploader

  def to_param
    [id, title.parameterize].join("-")
  end
end
