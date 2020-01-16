require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @grid = params[:grid]
    @word = params[:word]
    if @word.chars.all? { |letter| @word.count(letter) <= @grid.count(letter) }
      response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
        json = JSON.parse(response.read)
        if json['found'] == true
        # return json['found']
        @result = 'well done 🥳'
      else
        @result = 'not an english word 😂'
      end
    else
      @result = 'not in the grid 😏'
    end
  end
end

#The word can’t be built out of the original grid
#The word is valid according to the grid, but is not a valid English word
#The word is valid according to the grid and is an English word
