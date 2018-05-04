class Business < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true, uniqueness: true
  validates :yelp_id, presence: true, uniqueness: true


  def self.yelp_search
    key = 'Oy-rX2J3k7faj2cCZCiXvgyEfoQCMgQELMqmQ90eOiQavkNYjyYNLhBjVZJKy5SchfniUakBbgaChA_yEOBCrci_s5SWmf2ElsTvQDgvl6K9d-21XM2Kv0NB5nHsWnYx'
    location = 'New York City'
    # lat = 40.732013
    # lon = -73.996155
    search = 'restaurants'

    request = RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{search}&location=#{location}", {'Authorization': "Bearer #{key}"})

    businesses = JSON.parse(request)['businesses']

    # all_businesses = businesses.map do |business|
    #   Restaurant.create(rest_id: business['id'], name: business['name'], address: business['location']['address1'], cuisine: businesses['categories']['title'], average_cost: business['price'], image: business['image_url'])
    # end
  end

# ////////////////////////////////// OLD API

  def get_by_restaurant_id
    key = '9bf843f7c682d033fe0acba3677ed69b'
    rest_id = 16774318

    request = RestClient.get("https://developers.zomato.com/api/v2.1/restaurant?res_id=#{rest_id}", {'user-key': key})

    JSON.parse(request)
  end

  def self.get_nyc_restaurants
    key = '9bf843f7c682d033fe0acba3677ed69b'
    lat = 40.732013
    lon = -73.996155
    radius = 1000

    request = RestClient.get("https://developers.zomato.com/api/v2.1/search?lat=#{lat}&lon=#{lon}&radius=#{radius}", {'user-key': key, 'lat': lat,'lon': lon,'radius': radius})

    restaurants = JSON.parse(request)['restaurants']

    newRestaurants = restaurants.map do |rest|
      Restaurant.create(rest_id: rest['restaurant']['id'], name: rest['restaurant']['name'], address: rest['restaurant']['location']['address'], cuisine: rest['restaurant']['cuisines'], average_cost: rest['restaurant']['average_cost_for_two'], image: rest['restaurant']['featured_image'])
    end
  end

  def get_cuisines(search)
    key = '9bf843f7c682d033fe0acba3677ed69b'
    lat = 40.732013
    lon = -73.996155

    request = RestClient.get("https://developers.zomato.com/api/v2.1/cuisines?lat=#{lat}&lon=#{lon}", {'user-key': key, 'lat': lat,'lon': lon})

    cuisines = JSON.parse(request)['cuisines']

    cuisines.find do |cuisine|
      cuisine['cuisine']['cuisine_name'] == search
    end
  end

  def get_categories(search)
    key = '9bf843f7c682d033fe0acba3677ed69b'

    request = RestClient.get("https://developers.zomato.com/api/v2.1/categories", {'user-key': key})

    categories = JSON.parse(request)

    categories.find do |category|
      category['category_name'] == search
    end
  end

end
