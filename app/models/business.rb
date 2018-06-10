class Business < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :yelp_id, presence: true, uniqueness: true


  def self.yelp_search(search=nil, location=nil, sort_base=nil)
    key = 'PBQ2ofgdx74cO85ZLdGQEvPP0Y38D8EPp6NIAT5aeBB9dy-RowD_WcA07tC9AaZ5MIhlNqvbpxSeQA4RwIZO8qeP1FCMXHBD9tR3K3D8ZBPLI41nVxXh06QiaggbW3Yx'
    limit = "&limit=21"
    # search = "restaurants"
    location = "New York, New York"
    # categories = "&categories=#{}"
    # price = "&price=#{}"

    if sort_base
      sort_by = "&sort_by=#{sort_base}"
    else
      sort_by = ''
    end

    request = RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{search}&location=#{location}", {'Authorization': "Bearer #{key}"})
    # request = RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{search}&location=#{location}#{categories}#{price}#{limit}" + "#{sort_by}", {'Authorization': "Bearer #{key}"})

    response = JSON.parse(request)['businesses']

    businesses = response.map do |business|
      Business.create(yelp_id: business['id'], name: business['name'], address: business['location']['address1'], city: business['location']['city'], state: business['location']['state'], zip_code: business['location']['zip_code'], lat: business['coordinates']['latitude'], long: business['coordinates']['longitude'], cuisine: business['categories'][0]['title'], price: business['price'], rating: business['rating'], review_count: business['review_count'], image: business['image_url'], url: business['url'])
    end
  end


end
