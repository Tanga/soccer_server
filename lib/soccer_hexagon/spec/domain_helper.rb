RSpec.configure do |config|
  config.after(:each) do
    SoccerHexagon.new.delete_all
  end
end
