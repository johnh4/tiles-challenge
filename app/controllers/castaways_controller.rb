class CastawaysController < ApplicationController
  def index
		@team = Team.create
  end

  def recruit
		@team = Team.find(params[:team_id])
		@castaway = @team.castaways.create(castaway_params)
		#@team = Team.find(params[:team_id])
		#@castaway = @team.castaways.create(params[:castaway].permit(:name))
		#render :index
		@recruited = true
  end

	private

		def castaway_params
			params.require(:castaway).permit(:name )
		end
end
