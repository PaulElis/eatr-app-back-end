class User < ApplicationRecord

  has_many :reviews
  has_many :businesses, through: :reviews

  validates :name, presence: true, uniqueness: true

end
