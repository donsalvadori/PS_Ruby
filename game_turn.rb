require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module GameTurn
	def self.take_turn(p)
		die = Die.new
		case die.roll
		when 1..2
			p.hurt
		when 3..4
			puts "#{p.name} was skipped"
		else
			p.heal
		end

		treasure = TreasureTrove.random
		p.found_treasure(treasure)
	end
end