# frozen_string_literal: true

class User
  attr_accessor :choices, :name, :symbol

  def initialize(symbol)
    puts 'What\'s your name?'
    @name = gets.chomp
    @symbol = symbol
    @choices = []
  end

  def choose_cell(empty_cells)
    puts "#{@name}, choose an empty cell between 1 and 9"
    until empty_cells.include?(choice = gets.chomp.to_i)
      puts 'Choose an empty cell between 1 and 9'
    end

    @choices.push(choice)
    choice
  end
end
