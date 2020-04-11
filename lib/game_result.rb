class GameResult
  attr_reader :winner

  def initialize(game_grid)
    @game_grid = game_grid
    @winner = winning_token
  end

  def finished?
    winner.present? || @game_grid.all?(&:present?)
  end

  def to_s
    return "#{ winning_token } Wins!" if winning_token.present?

    return 'Tie!' if @game_grid.all?(&:present?)

    return 'In Progress'
  end

  private

    def winning_token
      # find the first winning token
      ['X', 'O'].find do |token|
        token_indices = @game_grid.map.with_index{ |item, index| index if item.to_s.upcase == token }.compact

        [won_horizontally?(token_indices), won_vertically?(token_indices), won_diagonally?(token_indices)].any?
      end
    end

    def won_horizontally?(token_indices)
      [[0,1,2], [3,4,5], [6,7,8]].any? do |winning_indices|
        (winning_indices - token_indices).empty?
      end
    end

    def won_vertically?(token_indices)
      [[0,3,6], [1,4,7], [2,5,8]].any? do |winning_indices|
        (winning_indices - token_indices).empty?
      end
    end

    def won_diagonally?(token_indices)
      [[0,4,8], [2,4,6]].any? do |winning_indices|
        (winning_indices - token_indices).empty?
      end
    end
end