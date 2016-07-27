require "rails_helper"
require "spec_helper"

RSpec.describe ProductsController, :type => :request do

  describe "Post #order as json format" do
    let(:arr) { [{"package_size" => 5, "quantity" => 2, "amount" => 17.98},
                 {"package_size" => 3, "quantity" => 1, "amount" => 6.99}] }

    it "returns array of hashes in json format" do
      product = Product.create(name: "Vegemite Scroll", code: "VS5")
      product.packages.create([
                                  {size: 3, price: 6.99},
                                  {size: 5, price: 8.99}]
      )
      post "/product/#{product.id}/order", :order => {quantity: "13"}, :id => product.id, format: "json"
      expect(JSON.parse(response.body)).to eq(arr)
    end
  end
end