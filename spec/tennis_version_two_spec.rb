require 'tennis_version_two'

describe TennisVersionTwo do
  let(:tennis) { subject }

  it 'gives a score of Love-Love' do
    expect(tennis.score).to eq('Love-Love')
  end

  context 'when Player One only scores' do
    it 'gives a score of Fifteen-Love when Player One wins a point' do
      tennis.win_point(:player_one)
      expect(tennis.score).to eq('Fifteen-Love')
    end

    it 'gives a score of Thirty-Love when Player One wins two points' do
      2.times { tennis.win_point(:player_one) }
      expect(tennis.score).to eq('Thirty-Love')
    end

    it 'gives a score of Fourty-Love when Player One wins three points' do
      3.times { tennis.win_point(:player_one) }
      expect(tennis.score).to eq('Fourty-Love')
    end
  end

  context 'when Player Two only scores' do
    it 'gives a score of Love-Fifteen when Player Two wins a point' do
      tennis.win_point(:player_two)
      expect(tennis.score).to eq('Love-Fifteen')
    end

    it 'gives a score of Love-Thirty when Player Two wins two points' do
      2.times { tennis.win_point(:player_two) }
      expect(tennis.score).to eq('Love-Thirty')
    end

    it 'gives a score of Love-Fourty when Player Two wins three points' do
      3.times { tennis.win_point(:player_two) }
      expect(tennis.score).to eq('Love-Fourty')
    end
  end
end
