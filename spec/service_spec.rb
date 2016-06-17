require 'service'

RSpec.describe Service, "#weather" do
  context "with default units (metric)" do
    it "gets the weather for specified city" do
      service = Service.new
      response = service.weather('London')
      expect(response['cod']).to eq 200
      expect(response['name']).to eq 'London'
      expect(response['sys']['country']).to eq 'GB'
      expect(response['weather']).not_to be_nil
      expect(response['wind']['speed']).not_to be_nil
      expect(response['wind']['deg']).not_to be_nil
    end
  end
end
