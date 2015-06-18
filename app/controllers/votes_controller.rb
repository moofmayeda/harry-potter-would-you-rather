class VotesController < ApplicationController
  def create
    @pair = Pair.find(params[:pair_id])
    @choice = Choice.find(params[:id])
    @choice.vote(@pair)
  end
end