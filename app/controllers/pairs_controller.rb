class PairsController < ApplicationController
  helper_method :sort_direction, :sort_param, :search_param
  def stats
    if sort_direction == "asc"
      if sort_param == "winning"
        @pairs = Pair.search(params[:search]).sort_by {|pair| [pair.greater_percent, pair.greater_count] }
      else
        @pairs = Pair.search(params[:search]).sort_by {|pair| [pair.lesser_percent, pair.lesser_count] }
      end
    else
      if sort_param == "winning"
        @pairs = Pair.search(params[:search]).sort_by {|pair| [pair.greater_percent, pair.greater_count] }.reverse
      else
        @pairs = Pair.search(params[:search]).sort_by {|pair| [pair.lesser_percent, pair.lesser_count] }.reverse
      end
    end
  end

private
  def sort_param
    params[:sort] ? params[:sort] : "winning"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

  def search_param
    params[:search]
  end
end