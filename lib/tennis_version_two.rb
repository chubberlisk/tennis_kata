class TennisVersionTwo
  POINTS_TO_SCORE = %w[Love Fifteen Thirty Fourty].freeze

  def initialize
    @player_one_points = 0
    @player_two_points = 0
  end

  def win_point(player)
    return @player_one_points -= 1 if player_one_lose_advantage?(player)
    return @player_two_points -= 1 if player_two_lose_advantage?(player)

    player == :player_one ? @player_one_points += 1 : @player_two_points += 1
  end

  def score
    return 'Deuce' if deuce?
    return output_advantage if advantage?
    return output_winner if winner?

    "#{POINTS_TO_SCORE[@player_one_points]}-#{POINTS_TO_SCORE[@player_two_points]}"
  end

  private

  def player_one_lose_advantage?(point_winner)
    point_winner == :player_two && @player_one_points == 4
  end

  def player_two_lose_advantage?(point_winner)
    point_winner == :player_one && @player_two_points == 4
  end

  def deuce?
    @player_one_points == 3 && @player_two_points == 3
  end

  def advantage?
    @player_one_points.between?(3, 4) && @player_two_points.between?(3, 4)
  end

  def winner?
    (@player_one_points == 4 && @player_two_points <= 2) || (@player_one_points == 5 && @player_two_points == 3) ||(@player_two_points == 4 && @player_one_points <= 2) || (@player_two_points == 5 && @player_one_points == 3)
  end

  def output_advantage
    @player_one_points == 4 ? 'Advantage Player One' : 'Advantage Player Two'
  end

  def output_winner
    @player_one_points >= 4 ? 'Player One wins!' : 'Player Two wins!'
  end
end
