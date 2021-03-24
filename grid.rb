# frozen_string_literal: true

require_relative 'user'

class Grid
  attr_reader :empty_cells, :user1, :user2

  def initialize
    @empty_cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print 'First player: '
    @user1 = User.new('x')
    print 'Second player: '
    @user2 = User.new('o')
  end

  def print_grid
    grid_elements = Array.new(9, ' ')

    @user1.choices.each do |element|
      grid_elements[element - 1] = @user1.symbol
    end

    @user2.choices.each do |element|
      grid_elements[element - 1] = @user2.symbol
    end

    puts ""
    puts " #{grid_elements[0]} | #{grid_elements[1]} | #{grid_elements[2]}"
    puts '---+---+---'
    puts " #{grid_elements[3]} | #{grid_elements[4]} | #{grid_elements[5]} "
    puts '---+---+---'
    puts " #{grid_elements[6]} | #{grid_elements[7]} | #{grid_elements[8]} "
  end

  def self.winning_combinations
    winning_combinations = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal
      [1, 4, 7], [2, 5, 8], [3, 6, 9],  # vertical
      [1, 5, 9], [3, 5, 7]              # diagonal
    ]
  end

  def play_round(user, grid)
    choice = user.choose_cell(empty_cells)
    empty_cells.delete(choice)
    grid.print_grid
    check_if_win(user)
  end

  def check_if_win(user)
    Grid.winning_combinations.each do |combination|
      if (combination & user.choices) == combination
        puts "#{user.name} won!"
        exit
      end
    end
    if check_full_grid?
      puts 'It\'s a tie!'
      exit
    end
  end

  def check_full_grid?
     empty_cells.length.zero? 
  end
end
