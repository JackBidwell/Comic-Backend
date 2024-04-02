# app/controllers/comics_controller.rb

class ComicsController < ApplicationController
    def index
      render json: MarvelService.new.comics
    end
  end
  