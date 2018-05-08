class Business < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :yelp_id, presence: true, uniqueness: true


  def self.yelp_search(search=nil, location=nil, sort_base=nil)
    key = 'Oy-rX2J3k7faj2cCZCiXvgyEfoQCMgQELMqmQ90eOiQavkNYjyYNLhBjVZJKy5SchfniUakBbgaChA_yEOBCrci_s5SWmf2ElsTvQDgvl6K9d-21XM2Kv0NB5nHsWnYx'
    limit = "&limit=21"
    categories = "&categories=#{}"
    price = "&price=#{}"

    if sort_base
      sort_by = "&sort_by=#{sort_base}"
    else
      sort_by = ''
    end
    # byebug

    # lat = 40.732013
    # lon = -73.996155

    request = RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{search}&location=#{location}#{categories}#{price}#{limit}" + "#{sort_by}", {'Authorization': "Bearer #{key}"})

    response = JSON.parse(request)['businesses']

    businesses = response.map do |business|
      Business.create(yelp_id: business['id'], name: business['name'], address: business['location']['address1'], city: business['location']['city'], state: business['location']['state'], zip_code: business['location']['zip_code'], lat: business['coordinates']['latitude'], long: business['coordinates']['longitude'], cuisine: business['categories'][0]['title'], price: business['price'], rating: business['rating'], review_count: business['review_count'], image: business['image_url'], url: business['url'])
    end
  end


end
