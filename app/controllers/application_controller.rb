# This is application Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :register_hexagon

  def register_hexagon(hexagon = SoccerHexagon.new(repos_container: Repositories))
    @hexagon ||= hexagon
  end

  def hexagon
    @hexagon
  end
end
