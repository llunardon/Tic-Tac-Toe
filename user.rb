class User 
  attr_accessor :choices, :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @choices = []
  end

  def choose_cell(empty_cells)
    puts 'Choose an empty cell'
    until empty_cells.include?(choice = Integer(gets.chomp))
      puts 'Choose an empty cell'
    end

    @choices.push(choice)
    choice
  end
end
