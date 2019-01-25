require 'pry'

class Snake
  attr_accessor :game_starting_order
  def initialize(game_starting_order)
    @snake_point = {'31' => '14', '37' => '17', '73' => '53', '78' => '39', '92' => '35', '99' => '7'}
    @ladder_point = {'5' => '25', '10' => '29', '22' => '41', '28' => '55', '44' => '95', '70' => '89', '79' => '81'}
    game_starts(game_starting_order)
  end
  private
  def game_starts(game_order)
    player_position = {}
    wining_point = 0
    while wining_point == 0
      game_order.each do |player|
          puts "Player #{player} turn"
          players = gets
        if player_position[player] != nil
          player_position[player] = (player_position[player].to_i + players.to_i)
          @current_position = player_position[player]
        else
          player_position[player] = players.to_i
          @current_position = player_position[player]
        end
        if @snake_point.key?(@current_position.to_s)
          player_position[player] = @snake_point[@current_position.to_s].to_i
        elsif @ladder_point.key?(@current_position.to_s)
          player_position[player] = @ladder_point[@current_position.to_s].to_i
        end
        break if player_position.values.max >= 100
      end
      if player_position.values.max >= 100
        wining_point = 1
        puts player_position.key(player_position.values.max)
        puts 'Hurray... Player-' + player_position.key(player_position.values.max).to_s + ' won the match!'
      end
    end
  end
end

puts 'Enter no of players'
no_of_players = gets
no_of_players.chomp
no_of_players = no_of_players.to_i
check_start_order = {}
no_of_players.times do |player_number|
  player_number = player_number + 1
  puts "Player #{player_number} turn"
  values = gets
  check_start_order[player_number] = values.chomp
end
puts 'Hurray! Game Starting order is'
game_starting_order = check_start_order.keys.sort {|a, b| check_start_order[b] <=> check_start_order[a]}
puts game_starting_order

game_starts = Snake.new(game_starting_order)
