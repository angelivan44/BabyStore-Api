class User < ApplicationRecord
  has_secure_password
  has_secure_token
  attribute :role, :string, default: "user"
  validates :username, presence: true, uniqueness: true
  has_many :favoritable , source: :favoritable, class_name: 'Favoritable'
  has_many :favorites , through: :favoritable , source: :clothe, class_name: 'Clothe'
  has_many :wantable, source: :wantable, class_name: 'Wantable'
  has_many :wants, through: :wantable , source: :clothe, class_name: 'Clothe'
  has_many :buyable, source: :buyable, class_name: 'Buyable'
  has_many :buys, through: :buyable , source: :clothe, class_name: 'Clothe'
  
  
  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(username, password)
    user = find_by(username: username)
    user if user&.authenticate(password)
  end
end
