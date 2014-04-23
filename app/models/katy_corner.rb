class KatyCorner < ActiveRecord::Base

  validates :title, :brief, :body_document, presence: true

  mount_uploader :image1, KatyImagesUploader
  mount_uploader :image2, KatyImagesUploader
  mount_uploader :image3, KatyImagesUploader
  mount_uploader :image4, KatyImagesUploader
  mount_uploader :image5, KatyImagesUploader
  mount_uploader :image6, KatyImagesUploader
  mount_uploader :image7, KatyImagesUploader

  def to_param
    [id, title.parameterize].join("-")
  end
end
