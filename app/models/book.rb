class Book < ApplicationRecord
  mount_uploader :book_url, FileUploader
  mount_uploader :image_url, FileUploader
  validates_presence_of :name, :summary
end
