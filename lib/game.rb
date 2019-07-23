require 'bundler'
Bundler.require

require_relative 'lib/player'

class Game
	attr_accessor :human ,:player
	def initialize (name)
		@human = HumanPlayer.new(name)
		for i 1..4 
			@player[i] = Player.new("player_#{i}")
		end
	end


end