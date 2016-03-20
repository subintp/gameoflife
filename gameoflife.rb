require './lib/game_of_life'

cells = "#{File.read(ARGV[0])}".split("\n").map{ |row| row.split.map(&:to_i) }

GameOfLife.perform(cells,50)