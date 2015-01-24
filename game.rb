require_relative 'player'
require_relative 'die'

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
			die = Die.new
			case die.roll
			when 1..2
				p.hurt
			when 3..4
				puts "#{p.name} was skipped"
			else
				p.heal
			end
			puts p
		end
	end
end