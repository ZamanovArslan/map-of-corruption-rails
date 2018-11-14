require 'test_helper'

class RegionControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
   test "check primary key" do
     puts Region.find('kr')
   end
end
