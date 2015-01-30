require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player (a_player)
		@players << a_player
	end

	def high_score_entry(p)
		formatted_name = p.name.ljust(20, '.')
  	"#{formatted_name} #{p.score}"
	end

	def load_players(from_file)
	  File.readlines(from_file).each do |line|
	    name, health = line.split(',')
	    player = Player.new(name, Integer(health))
	    add_player(player)
	  end
	end

	def save_high_scores(to_file="high_scores.txt")
	  File.open(to_file, "w") do |file|
	    file.puts "#{@title} High Scores:"
	    @players.sort.each do |p|
	    	file.puts high_score_entry(p)
	    end
	  end
	end

	def print_name_and_health(player)
  	puts "#{player.name} (#{player.health})"
	end


	def print_stats
		strong_players, wimpy_players = @players.partition { |p| p.strong? }

  	puts "\n#{@title} Statistics:"

  	puts "\n#{strong_players.size} strong players:"
 		strong_players.each do |p|
    	print_name_and_health(p)
  	end    

  	puts "\n#{wimpy_players.size} wimpy players:"
  	wimpy_players.each do |p|
    	print_name_and_health(p)
  	end

  	@players.sort.each do |p|
  		puts "\n#{p.name}'s point totals:"
  		p.each_found_treasure do |treasure|
    		puts "#{treasure.points} total #{treasure.name} points"
  		end
  		puts "#{p.points} grand total points"
  	end

		puts "\n#{@title} High Scores:"
		@players.sort.each do |p|
  		puts high_score_entry(p)
		end
	end

	def play(rounds)
		1.upto(rounds) do |round|
			if block_given?
				break if yield
  		end

			puts "There are #{@players.size} players in #{@title}"
			@players.each do |p|
				puts p
			end

			treasures = TreasureTrove::TREASURES

			puts "\nThere are #{treasures.size} treasures to be found:"
			treasures.each do |treasure|
	  		puts "A #{treasure.name} is worth #{treasure.points} points"
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
end