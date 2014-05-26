class CastawaysController < ApplicationController
  def index
		@team = Team.create
  end

  def recruit
		@team = Team.find(params[:team_id])
		@castaway = @team.castaways.create(castaway_params)
		@recruited = true
		#calculate exception
		#unless exception, send to sk. recruited true
			#if exception, recruited false
		exception = rand(101) <= 15
		if exception
			#raise Error
			@recruited = false
		elsif @castaway.valid?
			team_id = params[:team_id]
			name = castaway_params[:name]
			Recruiter.perform_async(name, team_id, Time.now)
			@recruited = true
		end
  end

	private

		def castaway_params
			params.require(:castaway).permit(:name )
		end
end
