require_relative 'grid.rb'

class Game
  attr_accessor :grid

  def initialize
  end

  def self.play_game
    @grid = Grid.new()
    while true do
      @grid.play_round(@grid.user1, @grid)
      @grid.play_round(@grid.user2, @grid)
    end
  end
end

Game.play_game
