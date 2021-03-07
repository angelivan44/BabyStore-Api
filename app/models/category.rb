class Category < ApplicationRecord
  has_one_attached :cover
  has_many :clothes
end
