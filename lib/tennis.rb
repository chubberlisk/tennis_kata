class Tennis
  POINTS = {
    "0" => "15",
    "15" => "30",
    "30" => "40",
    "40" => "Adv",
    "Adv" => "Win"
  }

  def initialize
    @player_one_score = "0"
    @player_two_score = "0"
  end

  def score
    if deuce?
      @player_one_score = "40"
      @player_two_score = "40"
      "#{@player_one_score}-#{@player_two_score}"
    elsif player_one_wins_set_point? || player_one_wins_set?
      "Player One wins!"
    elsif player_two_wins_set_point? || player_two_wins_set?
      "Player Two wins!"
    else
      "#{@player_one_score}-#{@player_two_score}"
    end
  end

  def increase_score(player)
    player == :player_one ? @player_one_score = POINTS[@player_one_score] : @player_two_score = POINTS[@player_two_score]
  end

  private

  def player_one_wins_set_point?
    @player_one_score == "Adv" && (@player_two_score == "0" || @player_two_score == "15" || @player_two_score == "30")
  end

  def player_two_wins_set_point?
    @player_two_score == "Adv" && (@player_one_score == "0" || @player_one_score == "15" || @player_one_score == "30")
  end

  def deuce?
    (@player_one_score == "Adv" && @player_two_score == "Adv") || (@player_one_score == "Win" && @player_two_score == "Win") || (@player_one_score.nil? && @player_two_score.nil?)
  end

  def player_one_wins_set?
    @player_one_score == "Win"
  end

  def player_two_wins_set?
    @player_two_score == "Win"
  end
end
