class PairsController < ApplicationController
  def stats
    @pairs = Pair.all
    @dominating_pairs = Pair.dominant(70)
    @close_pairs = Pair.close(15)
  end
end