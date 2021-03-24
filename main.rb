# frozen_string_literal: true

require_relative 'grid'

def play_game
  grid = Grid.new
  loop do
    grid.play_round(grid.user1, grid)
    grid.play_round(grid.user2, grid)
  end
end

play_game
