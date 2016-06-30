class MatchesController < ApplicationController
  SoccerHexagon.repositories Repositories

  def index
    render json: SoccerHexagon.get_a_list_of_matches
  end

  def create
    render json: SoccerHexagon.create_a_match(
      on:          params[:datetime],
      between:     params[:team_ids],
      at_location: params[:pitch_id]
    )
  end

  def show
    render json: Matches.read(params[:id])
  end

  def update
    render json: Matches.update(params[:id], params[:match])
  end

  def delete
    render json: Matches.delete(params[:id])
  end
end
