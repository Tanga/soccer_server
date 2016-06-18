RSpec.configure do |config|
  config.after(:each) do
    Fixtures::Repository.__delete_all
  end
end
