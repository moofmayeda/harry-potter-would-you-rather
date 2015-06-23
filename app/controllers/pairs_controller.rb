class PairsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def stats
    @pairs = Pair.search(params[:search]).includes(:left).order(sort_column + ' ' + sort_direction)
    @dominating_pairs = Pair.dominant(70)
    @close_pairs = Pair.close(15)
  end

private
  def sort_column
    column_to_db(params[:sort])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end