require "httparty"
require "openweathermap_api"
require "rspec"

describe OpenweathermapApi do
	
	describe "Current Weather" do

		context "Given a City ID " do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_one_current("id=2172797").code).to eql(200)
			end
		end

		context "Given City Name and Country" do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_two_comma_current("q=London", "uk").code).to eql(200)
			end
		end

		context "Given geographic coordinates lat and long" do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_two_and_current("lat=35", "lon=139").code).to eql(200)
			end
		end

		context "Given a ZIP Code and Country Code" do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_two_comma_current("zip=94040", "us").code).to eql(200)
			end
		end

	end


end