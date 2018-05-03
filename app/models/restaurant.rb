class Restaurant < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  def get_restaurants
    key = '9bf843f7c682d033fe0acba3677ed69b'

    request = RestClient.get('https://developers.zomato.com/api/v2.1/restaurant?res_id=16774318
', {'user-key': key})

    JSON.parse(request)
  end

  def self.get_nyc_restaurants
    key = '9bf843f7c682d033fe0acba3677ed69b'
    lat = 40.732013
    lon = -73.996155
    radius = 1000

    # b['restaurants'][0]['restaurant']['name']

    request = RestClient.get('https://developers.zomato.com/api/v2.1/search?lat=40.732013&lon=-73.996155&radius=1000
', {'user-key': key, 'lat': lat,'lon': lon,'radius': radius})



    results = JSON.parse(request)
    # @restaurant_id = results['restaurants'][0]['restaurant']['id']

  end

# def self.get_restaurant_id

end
