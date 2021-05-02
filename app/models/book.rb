class Book < ApplicationRecord
  mount_uploader :book_url, FileUploader
  mount_uploader :image_url, FileUploader
  validates_presence_of :name, :summary

  def download_url
    self[:book_url].include?("github") ? self[:book_url] : book_url
  end
end
