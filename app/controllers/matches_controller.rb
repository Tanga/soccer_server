class MatchesController < ApplicationController
  def index
    render json: hexagon[:get_a_list_of_matches]
  end

  def create
    result = hexagon[:create_a_match,
      on:          params[:on],
      between:     params[:between],
      at_location: params[:at_location]]

    if result.errors.present?
      render json: result, status: :unprocessable_entity
    else
      head :created
    end
  end

  def show
    render json: hexagon.query(:matches, id: params[:id])
  end

  def update
    render json: Matches.update(params[:id], params[:match])
  end

  def delete
    render json: Matches.delete(params[:id])
  end
end
