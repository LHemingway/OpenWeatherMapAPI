require "httparty"
require "json"

class OpenweathermapApi 
	include HTTParty

	base_uri "http://api.openweathermap.org/data/2.5"

# Current Weather API
	def self.get_one_current(param)
		self.get("/weather?#{param}&APPID=fdbfbd25e7752e2d6c0c210fb8daf52b")
		# self.get("/weather?#{param}&(ENV['OPENWEATHERAPIKEY'])")
	end

	def self.get_two_comma_current(param, two)
		self.get("/weather?#{param},#{two}&APPID=fdbfbd25e7752e2d6c0c210fb8daf52b")
	end

	def self.get_two_and_current(param, two)
		self.get("/weather?#{param}&#{two}&APPID=fdbfbd25e7752e2d6c0c210fb8daf52b")
	end



end