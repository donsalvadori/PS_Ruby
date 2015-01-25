require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player (a_player)
		@players << a_player
	end

	def play
		puts "There are #{@players.size} players in #{@title}"
		@players.each do |p|
			puts p
		end

		@players.each do |p|
			GameTurn.take_turn(p)
			puts p
		end
	end
end