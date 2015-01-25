module GameTurn
	def self.take_turn(player)
		die = Die.new
		case die.roll
		when 1..2
			p.hurt
		when 3..4
			puts "#{p.name} was skipped"
		else
			p.heal
		end
	end
end