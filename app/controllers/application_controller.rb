# This is application Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :register_hexagon

  def register_hexagon(hexagon = SoccerHexagon.new(Repositories))
    @hexagon ||= hexagon
  end
end
