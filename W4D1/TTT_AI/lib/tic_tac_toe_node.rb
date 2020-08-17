require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return false if @board.over? && !@board.won?
    if @board.over? && @board.winner != evaluator
      return true
    elsif @board.over? && @board.winner == evaluator
      return false
    end


    current_children = self.children
    if evaluator == next_mover_mark
      current_children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      current_children.any? do |child|
        child.losing_node?(evaluator)
      end
    end
  end

  def winning_node?(evaluator)
    if @board.over? && @board.winner == evaluator
      return true
    elsif @board.over? && @board.winner != evaluator
      return false
    end
    current_children = self.children
    if evaluator == next_mover_mark
      current_children.any? do |child|
        child.winning_node?(evaluator)
      end
    else
      current_children.all? do |child|
        child.winning_node?(evaluator)
      end
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []
    (0...@board.rows.length).each do |i|
      (0...@board.rows[i].length).each do |j|
        if @board.empty?([i, j])
          moves << [i, j]
        end
      end
    end
    child = []
    moves.each do |move|
      copy = @board.dup
      copy[move] = @next_mover_mark
      if @prev_move_pos == nil
        prev_mark = :o 
      else
        prev_mark = copy[prev_move_pos]
      end
      child_node = TicTacToeNode.new(copy, prev_mark, move )
      child << child_node
    end
    return child
  end
end
