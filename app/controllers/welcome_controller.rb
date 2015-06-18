class WelcomeController < ApplicationController
  def index
    offset = rand(Pair.count)
    @pair = Pair.offset(offset).first
  end
end