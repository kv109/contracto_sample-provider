# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'contracto/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

require 'rake'
Rails.application.load_tasks

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  Contracto::RSpec.start!(git: 'https://github.com/kv109/contracto_sample-contract.git')

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    Rake::Task['db:reset'].invoke
  end
end
