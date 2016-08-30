class RestaurantsController < ApplicationController
  require "data_fetch/main.rb"
  def index
    respond_to do |format|
      data = DataFetch::Main.get_restaurents["businesses"]
      data = data.collect{|x| {restaurent_name: x["name"], review_count: x["review_count"], address: {latitude: x["latitude"], longitude: x["longitude"], city: x["city"], state: x["state"], zipcode: x["zip"]}, rating: x["avg_rating"]}}
      format.json {render json: data }
    end
  end
end
