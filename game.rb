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

	def print_stats
		strong_players, wimpy_players = @players.partition { |player| player.strong? }
	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}"
		@players.each do |p|
			puts p
		end

		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |p|
				GameTurn.take_turn(p)
				puts p
			end
		end
	end
end