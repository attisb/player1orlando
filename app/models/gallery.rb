class Gallery < ActiveRecord::Base

  mount_uploader :image, GalleryImageUploader

end
