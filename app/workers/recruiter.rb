class Recruiter
  include Sidekiq::Worker

  def perform(name, team_id, time, history_id,rival=false)
		team = Team.find(team_id)
		history = History.find(history_id)
		castaway = team.castaways.create(name: name, rival: rival)
		history.add_name(name)
		history.save
		puts "history.total: #{history.total}"
  end

end
