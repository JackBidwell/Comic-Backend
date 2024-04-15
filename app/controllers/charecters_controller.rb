class CharectersController < ApplicationController
    def index
        marvel_service = MarvelService.new
        spiderman_comics = marvel_service.comics_for_character(1)
        render json: spiderman_comics
    end
end
