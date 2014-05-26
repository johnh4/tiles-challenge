class Recruiter
  include Sidekiq::Worker

  def perform(name, team_id, time)
		team = Team.find(team_id)
		castaway = team.castaways.create(name: name)
		#history.add_name(name)
  end

end
