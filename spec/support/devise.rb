# frozen_string_literal: true

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
end
