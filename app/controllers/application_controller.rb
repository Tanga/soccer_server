# This is application Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :initialize_apps

  def initialize_apps
    @fixtures_app  = Fixtures::App.new #repository: Fixtures::SQLRepository
    @pitches_app   = Pitches::App.new  #repository: Pitches::SQLRepository
    @teams_app     = Teams::App.new    #repository: Teams::SQLRepository
    @players_app   = Players::App.new  #repository: Players::SQLRepository
    @matches_app   = Matches::App.new  #repository: Matches::SQLRepository
  end
end
