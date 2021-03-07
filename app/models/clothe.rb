class Clothe < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  has_many :favoritable , source: :favoritable, class_name: 'Favoritable'
  has_many :favorites , through: :favoritable , source: :user, class_name: 'User'
  has_many :wantable, source: :wantable, class_name: 'Wantable'
  has_many :wants, through: :wantable , source: :user, class_name: 'User'
  has_many :buyable, source: :buyable, class_name: 'Buyable'
  has_many :buys, through: :buyable , source: :user, class_name: 'User'
end
