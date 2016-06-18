RSpec.configure do |config|
  config.after(:each) do
    Fixtures::Repository.delete_all
  end
end
