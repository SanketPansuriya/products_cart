require "test_helper"
require "generators/my_service/my_service_generator"

class MyServiceGeneratorTest < Rails::Generators::TestCase
  tests MyServiceGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
