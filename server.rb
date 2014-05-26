require 'sinatra'
require 'pry'

def team_and_scores
team_and_scores = [
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
]
end

# def list_of_teams
# 	list = []
# 	team_and_scores.each do |team_to_list|
# 		list << team_to_list[:home_team] if team_to_list[:home_team].uniq
# 		binding.pry
# 	end
# 	list
# end

def wins
  win_array = []
  team_and_scores.each do |win_or_lose|
    if win_or_lose[:home_score] > win_or_lose[:away_score]
      win_array << win_or_lose[:home_team]
    else
      win_array << win_or_lose[:away_team]
    end
  end
  win_array
end

def losses
  loss_array = []
  team_and_scores.each do |win_or_lose|
    if win_or_lose[:home_score] > win_or_lose[:away_score]
      loss_array << win_or_lose[:away_team]
    else
      loss_array << win_or_lose[:home_team]
    end
  end
  loss_array
end

def find_team_for_bio(home_team)
	team_bio = nil
	team_and_scores.each do |team_to_find|
		team_bio = team_to_find if team_to_find[:home_team] == home_team
		end
		team_bio
end

get '/' do
	@team_and_scores = team_and_scores
	# @list_of_teams = list_of_teams
	erb :index
end

get '/leaderboard' do
  @wins = wins
  @losses = losses
	@team_and_scores = team_and_scores
	erb :leaderboard
end

get '/:home_team' do
	@team_bio = find_team_for_bio(params[:home_team])
	erb :team
end