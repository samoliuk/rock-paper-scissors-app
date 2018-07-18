class ThrowsController < ApplicationController

  respond_to :json, :html

  def new
  end

  def throw
    respond_with(@game = CompetitionService.new(throw_params).call, location: throw_path)
  end

  private

  def throw_params
    params.permit(:sign)
  end
end
