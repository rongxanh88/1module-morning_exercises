class SoccerLeague
  attr_reader :division1, :division2, :division3, :division4
  attr_accessor :schedule

  def initialize
    @division1 = [team_1, team_2, team_3, team_4, team_5, team_6, team_7, team_8]
    @division2 = [team_11, team_12, team_13, team_14, team_15, team_16, team_17, team_18]
    @division3 = [team_21, team_22, team_23, team_24, team_25, team_26, team_27, team_28]
    @division4 = [team_31, team_32, team_33, team_34, team_35, team_36, team_37, team_38]
    @schedule = []
  end
  
  def games(game_num, team1, team2, date = "03-12-2017")
    game = Hash.new
    time = Date.strptime(date)
    string = "#{team1} vs #{team2} on #{time}."
    game[game_num] = string
    return game
  end
  
  def play_own_division(schedule, division)
