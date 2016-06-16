require 'service'

RSpec.describe Service, "#score" do
  context "with no strikes or spares" do
    it "sums the pin count for each roll" do
      service = Service.new
      20.times { service.hit(4) }
      expect(service.score).to eq 80
    end
  end
end

