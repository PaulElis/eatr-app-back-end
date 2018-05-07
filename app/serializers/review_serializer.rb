class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :text, :rating, :image_url, :user_id, :business_id 
  belongs_to :business
end
