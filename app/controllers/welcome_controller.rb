class WelcomeController < ApplicationController
  def index
    offset = rand(Pair.count)
    @pair = Pair.offset(offset).first
    @random_image = random_image
  end

private
	def random_image
    files = Dir.entries(
      "#{Rails.root}/public/images" 
    ).select { |filename|  File.extname(filename) == ".jpg"  }
    files[rand(files.length)]
  end
end