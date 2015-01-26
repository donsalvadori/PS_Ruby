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
		strong_players, wimpy_players = @players.partition { |p| p.strong? }

  	puts "\n#{@title} Statistics:"

  	puts "\n#{strong_players.size} strong players:"
 		
 		strong_players.each do |p|
    	puts "#{p.name} (#{p.health})"
  	end    

  	puts "\n#{wimpy_players.size} wimpy players:"
  	
  	wimpy_players.each do |p|
    	puts "#{p.name} (#{p.health})"
  	end
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