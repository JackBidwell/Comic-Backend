class ComicsController < ApplicationController
  def index
    marvel_service = MarvelService.new
    @comics = marvel_service.comics
    render json: @comics
    spiderman_comics = marvel_service.comics_for_character(1009610)
  end
end
  