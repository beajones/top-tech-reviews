require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  get '/notfound' do
    erb :notfound
  end
  
  post '/results' do
    @news_site = params[:site]
    
    # depending on the site chosen, get array of article hashes
    if @news_site == "ign"
      @reviews = get_reviews(ign_api_get_articles)
    elsif @news_site == "polygon"
      @reviews = get_reviews(polygon_api_get_articles)
    elsif @news_site == "techradar"
      @reviews = get_reviews(techradar_api_get_articles)
    elsif @news_site == "mashable"
      @reviews = get_reviews(mashable_api_get_articles)
    elsif @news_site == "ew"
      @reviews = get_reviews(ew_api_get_articles)
    else
      @reviews =[]
    end
    
    if @reviews.empty?
      # if no reviews are found from that site, take to a page with 
      # a second drop-down so the user can pick again right there
      erb :notfound
    else
      # otherwise, take them to the results page showing the reviews
      # from the site of their choice
      erb :results
    end
  end






end