class Player
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0)
	end

	def score
		@health + @name.length
	end


  def <=>(other)
    other.score <=> score
  end

	def name=(new_name)
  	@name = new_name.capitalize
	end

	def to_s
		"I'm #{@name} with a health of #{@health} and a score of #{score}."
	end

	def strong?
		@health > 100
	end

	def hurt
		@health -= 10
		puts "#{@name} got hurt!"
	end

	def heal
		@health += 15
		puts "#{@name} got healed!"
	end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.heal
  puts player.health
  player.hurt
  puts player.health
end

