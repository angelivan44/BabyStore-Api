class Category < ApplicationRecord
  has_one_attached :cover
  has_many :clothes

  def service_url
    "http://localhost:3000"+ Rails.application.routes.url_helpers.rails_blob_path(cover, only_path: true)
  end
end
