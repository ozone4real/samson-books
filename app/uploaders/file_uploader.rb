class FileUploader < CarrierWave::Uploader::Base
  if ENV["RACK_ENV"] == "development"
    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  if ENV["RACK_ENV"] == "production"
    include Cloudinary::CarrierWave
    def public_id
      "samsonajewole/#{model.class.to_s.downcase}/#{mounted_as}/#{model.name.parameterize}"
    end
  end
end