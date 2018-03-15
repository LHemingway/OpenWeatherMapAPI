require "httparty"
require "openweathermap_api"
require "rspec"

describe OpenweathermapApi do
	
	describe "Current Weather" do

		context "Given a City ID " do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_one_current("id=2172797").code).to eql(200)
			end
			it "responds with a 400 bad request" do
				expect(OpenweathermapApi.get_one_current("London").code).to eql(400)
			end
			it "Check data is being returned in correct format" do
				expect(OpenweathermapApi.get_one_current("id=2656284").parsed_response).to be_instance_of Hash
			end
			it "Check the data is correct" do
				expect(OpenweathermapApi.get_one_current("id=2656284")["name"]).to eql("Barnsley")
			end
		end

		context "Given City Name and Country" do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_two_comma_current("q=London", "uk").code).to eql(200)
			end
			it "responds with a 400 bad request" do
				expect(OpenweathermapApi.get_two_comma_current("id=2172797", "us").code).to eql(400)
			end
			it "Check data is being returned in correct format" do
				expect(OpenweathermapApi.get_two_comma_current("q=Manchester", "uk").parsed_response).to be_instance_of Hash
			end
			it "Check the data is correct" do
				expect(OpenweathermapApi.get_two_comma_current("q=Manchester", "uk")["name"]).to be_instance_of String
			end
		end

		context "Given geographic coordinates lat and long" do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_two_and_current("lat=35", "lon=139").code).to eql(200)
			end
			it "responds with a 400 bad request" do
				expect(OpenweathermapApi.get_two_and_current("London", "uk").code).to eql(400)
			end
			it "Check data is being returned in correct format" do
				expect(OpenweathermapApi.get_two_and_current("lat=35", "lon=139").parsed_response).to be_instance_of Hash
			end
			it "Check the data is correct" do
				expect(OpenweathermapApi.get_two_and_current("lat=35", "lon=139")["name"]).to eql("Shuzenji")
			end
		end

		context "Given a ZIP Code and Country Code" do
			it "responds with an ok 200 code" do
				expect(OpenweathermapApi.get_two_comma_current("zip=94040", "us").code).to eql(200)
			end
			it "responds with a 400 bad request" do
				expect(OpenweathermapApi.get_two_comma_current("id=2172797", "uk").code).to eql(400)
			end
			it "Check data is being returned in correct format" do
				expect(OpenweathermapApi.get_two_comma_current("zip=94040", "us").parsed_response).to be_instance_of Hash
			end
			it "Check the data is correct" do
				expect(OpenweathermapApi.get_two_comma_current("zip=94040", "us")["name"]).to eql("Mountain View")
			end
		end

	end


end