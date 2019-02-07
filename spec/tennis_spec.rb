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

describe Tennis do
  let(:tennis) { Tennis.new }

  it "can return the score" do
    expect(tennis.score).to eq("0-0")
  end

  it "can increase the score" do
    tennis.increase_score(:player_one)
    expect(tennis.score).to eq("15-0")
  end

  it "can increase the score again" do
    2.times { tennis.increase_score(:player_one) }
    expect(tennis.score).to eq("30-0")
  end

  it "can increase the score three times" do
    3.times { tennis.increase_score(:player_one) }
    expect(tennis.score).to eq("40-0")
  end

  it "can increase the score for Player Two" do
    tennis.increase_score(:player_two)
    expect(tennis.score).to eq("0-15")
  end

  it "can increase the score again" do
    2.times { tennis.increase_score(:player_two) }
    expect(tennis.score).to eq("0-30")
  end

  it "can increase the score three times" do
    3.times { tennis.increase_score(:player_two) }
    expect(tennis.score).to eq("0-40")
  end

  it "can score both players" do
    tennis.increase_score(:player_one)
    tennis.increase_score(:player_two)
    expect(tennis.score).to eq("15-15")
  end

  it "can score both players again" do
    2.times do
      tennis.increase_score(:player_one)
      tennis.increase_score(:player_two)
    end
    expect(tennis.score).to eq("30-30")
  end

  it "can deuce both players" do
    3.times do
      tennis.increase_score(:player_one)
      tennis.increase_score(:player_two)
    end
    expect(tennis.score).to eq("40-40")
  end

  it "can give Player One an advantage" do
    3.times do
      tennis.increase_score(:player_one)
      tennis.increase_score(:player_two)
    end
    tennis.increase_score(:player_one)
    expect(tennis.score).to eq("Adv-40")
  end

  it "can give Player Two an advantage" do
    3.times do
      tennis.increase_score(:player_one)
      tennis.increase_score(:player_two)
    end
    tennis.increase_score(:player_two)
    expect(tennis.score).to eq("40-Adv")
  end

  it "can give a win to Player One" do
    4.times { tennis.increase_score(:player_one) }
    expect(tennis.score).to eq("Player One wins!")
  end

  it "can give a win to Player Two" do
    4.times { tennis.increase_score(:player_two) }
    expect(tennis.score).to eq("Player Two wins!")
  end

  it "can give a win to Player One when Player Two has scored" do
    3.times { tennis.increase_score(:player_one) }
    2.times { tennis.increase_score(:player_two) }
    tennis.increase_score(:player_one)
    expect(tennis.score).to eq("Player One wins!")
  end

  it "can give a win to Player Two when Player One has scored" do
    3.times { tennis.increase_score(:player_two) }
    2.times { tennis.increase_score(:player_one) }
    tennis.increase_score(:player_two)
    expect(tennis.score).to eq("Player Two wins!")
  end

  it "can give a win to Player One after advantage" do
    3.times { tennis.increase_score(:player_one) }
    3.times { tennis.increase_score(:player_two) }
    2.times { tennis.increase_score(:player_one) }
    expect(tennis.score).to eq("Player One wins!")
  end

  it "can give a win to Player Two after advantage" do
    3.times { tennis.increase_score(:player_one) }
    3.times { tennis.increase_score(:player_two) }
    2.times { tennis.increase_score(:player_two) }
    expect(tennis.score).to eq("Player Two wins!")
  end

  it "can return to deuce" do
    3.times { tennis.increase_score(:player_one) }
    3.times { tennis.increase_score(:player_two) }
    tennis.increase_score(:player_one)
    tennis.increase_score(:player_two)
    expect(tennis.score).to eq("40-40")
  end

  it "can return to deuce multiple times" do
    3.times { tennis.increase_score(:player_one) }
    3.times { tennis.increase_score(:player_two) }
    2.times do
      tennis.increase_score(:player_one)
      tennis.increase_score(:player_two)
    end
    expect(tennis.score).to eq("40-40")
  end
end