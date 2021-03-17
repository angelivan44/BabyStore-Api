class Category < ApplicationRecord

  has_one_attached :cover, dependent: :destroy
  has_many :clothes , dependent: :destroy
  validates :cover, presence: true
  def service_url
    Rails.application.routes.url_helpers.url_for(cover)
  end
end
