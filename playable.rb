module Playable
	def strong?
		health > 100
	end

	def hurt
		self.health -= 10
		puts "#{name} got hurt!"
	end

	def heal
		self.health += 15
		puts "#{name} got healed!"
	end
end