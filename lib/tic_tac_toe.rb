
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input_to_index)
  index = input.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |array|
    pos1 = board[array[0]]
    pos2 = board[array[1]]
    pos3 = board[array[2]]
    if pos1 == pos2 && pos1 == pos3 && pos1 != " " && pos1 != ""
      return array
    end
  end
  return false
end

def full?(board)
  counter = 0
  board.each do |take|
    if !position_taken?(board, counter)
      return false
    end
    counter += 1
  end
  return true
end

def draw?(board)
  WIN_COMBINATIONS.each do |array|
    pos1 = board[array[0]]
    pos2 = board[array[1]]
    pos3 = board[array[2]]
    if pos1 == pos2 && pos1 == pos3
      return false
    elsif pos1 == " " || pos2 == " " || pos3 == " "
      return false
    end
  end
  return true
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |array|
      pos1 = board[array[0]]
      pos2 = board[array[1]]
      pos3 = board[array[2]]
      if pos1 == pos2 && pos1 == pos3 && pos1 != " " && pos1 != ""
        return pos1
      end
    end
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 == 0
    return "X"
  else
    return "O"
  end
end
