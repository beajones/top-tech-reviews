#import the gems we need to pull data from an API
require 'net/http'
require 'json'
require 'rubygems'

# get the top 10 articles from IGN.com
def ign_api_get_articles
	#new_search_term = search_term.gsub(" ", "+")
	request_string = "https://newsapi.org/v1/articles?source=ign&sortBy=top&apiKey=ecd08186d0394c99bcd808f2f76eed1b"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	
	# articles stored as an ARRAY stored in value of key "articles"
	article_data = sample_parsedResponse["articles"]
	# data is now an array of 10 articles
	article_data
end

#get the top 10 articles from Polygon.com
def polygon_api_get_articles
	#new_search_term = search_term.gsub(" ", "+")
	request_string = "https://newsapi.org/v1/articles?source=polygon&sortBy=top&apiKey=ecd08186d0394c99bcd808f2f76eed1b"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	
	# articles stored as an ARRAY stored in value of key "articles"
	article_data = sample_parsedResponse["articles"]
	# data is now an array of 10 articles
	article_data
end

#get the top 10 articles from TechRadar.com
def techradar_api_get_articles
	#new_search_term = search_term.gsub(" ", "+")
	request_string = "https://newsapi.org/v1/articles?source=techradar&sortBy=top&apiKey=ecd08186d0394c99bcd808f2f76eed1b"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	
	# articles stored as an ARRAY stored in value of key "articles"
	article_data = sample_parsedResponse["articles"]
	# data is now an array of 10 articles
	article_data
end

#get the top 10 articles from Mashable.com
def mashable_api_get_articles
	#new_search_term = search_term.gsub(" ", "+")
	request_string = "https://newsapi.org/v1/articles?source=mashable&sortBy=top&apiKey=ecd08186d0394c99bcd808f2f76eed1b"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	
	# articles stored as an ARRAY stored in value of key "articles"
	article_data = sample_parsedResponse["articles"]
	# data is now an array of 10 articles
	article_data
end

#get the top 10 articles from EntertainmentWeekly.com
def ew_api_get_articles
	#new_search_term = search_term.gsub(" ", "+")
	request_string = "https://newsapi.org/v1/articles?source=entertainment-weekly&sortBy=top&apiKey=ecd08186d0394c99bcd808f2f76eed1b"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	
	# articles stored as an ARRAY stored in value of key "articles"
	article_data = sample_parsedResponse["articles"]
	# data is now an array of 10 articles
	article_data
end





# method to get reviews
# INPUT: an array of article hashes as fetched from an API
# OUTPUT: an array of the urls of reviews
def get_reviews(source_array)
    #search through urls for review
   
   article_array=[]
   
   source_array.each do |article_hash|
      #get the url for each article
      this_url = article_hash["url"]
      #check to see if this article is a review
      if this_url.end_with?("-review","review/") || this_url.include?("review-")
          #find the review, return the hash for this article
          article_array.push(article_hash)
      end
   end
   #return the array of review article hashes
   return article_array
end

#call above method that accesses IGN api

    # p get_reviews(ign_api_get_articles)
    # p get_reviews(polygon_api_get_articles)
    # p get_reviews(techradar_api_get_articles)
    # p get_reviews(mashable_api_get_articles)
    # p get_reviews(ew_api_get_articles)
