class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :yelp_id, :name, :cuisine, :price, :rating, :address, :city, :state, :zip_code, :review_count, :url, :image
  has_many :reviews
end
