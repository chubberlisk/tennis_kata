class TennisVersionTwo
  POINTS_TO_SCORE = %w[Love Fifteen Thirty Fourty].freeze

  def initialize
    @player_one_points = 0
    @player_two_points = 0
  end

  def win_point(player)
    player == :player_one ? @player_one_points += 1 : @player_two_points += 1
  end

  def score
    "#{POINTS_TO_SCORE[@player_one_points]}-#{POINTS_TO_SCORE[@player_two_points]}"
  end
end
