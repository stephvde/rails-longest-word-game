class GamesController < ApplicationController
  def new
    alphabet = ('A'..'Z').to_a
    @letters = []
    10.times do |letter|
      @letters << alphabet.sample
    end
  end

def score
   @word = params[:word]
   @letters = params[:letters]
   @answer = ""
   if @letters.gsub(/\s+/, "").include?(@word)
     @answer = "Congratulations"
   else @answer = "Lost"
   end
 end

  def english_word?(word)
   response = open("https://wagon-dictionary.herokuapp.com/#{word}")
   json = JSON.parse(response.read)
   return json['found']
  end

end
