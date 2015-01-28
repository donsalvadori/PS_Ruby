require_relative 'treasure_trove'

class Player
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0)
	end

	def score
		@health + points
	end

	def found_treasure(treasure)
		@found_treasures[treasure.name] += treasure.points
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
		puts "#{@name}'s treasures: #{@found_treasures}"
	end

	def points
		@found_treasures.values.reduce(0, :+)
	end


  def <=>(other)
    other.score <=> score
  end

	def name=(new_name)
  	@name = new_name.capitalize
	end

	def to_s
		"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
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

