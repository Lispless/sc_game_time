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

def find_team_for_bio(home_team)
	team_bio = nil
	team_and_scores.each do |team_to_find|
		team_bio = team_to_find if team_to_find[:home_team] == home_team
		end
		team_bio
end

get '/' do
	@team_and_scores = team_and_scores
	erb :index
end

get '/leaderboard' do
	@team_and_scores = team_and_scores
	erb :leaderboard
end

get '/:home_team' do
	@team_bio = find_team_for_bio(params[:home_team])
	erb :team
end