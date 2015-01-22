require_relative 'spec_helper'
require_relative 'player'

describe Player do
	it "has a capitalized name" do
  	player = Player.new("larry", 150)

  	player.name.should == "Larry"
	end
end