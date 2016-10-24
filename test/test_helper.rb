ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'simplecov'
SimpleCov.start
Rails.application.eager_load!
class ActiveSupport::TestCase
  fixtures :all
  Minitest::Reporters.use!
  def setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github', uid: '99999', info: { email: "a@b.com", name: "Ada" }
      })
  end

end
