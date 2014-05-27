class CastawaysController < ApplicationController
	rescue_from RivalCreated, with: :new_rival

	def intro
		
	end
	
  def index
		@team = Team.create
  end

  def recruit
		puts "$history: #{$history}"
		@team_id = params[:team_id]
		@team = Team.find(@team_id)
		@name = castaway_params[:name]
		is_new_rival = rand(101) <= 30
		if is_new_rival
			raise RivalCreated.new "This person doesn't like you very much."
		elsif @team.is_full?
			puts "full team"
			redirect_to :game_over
		elsif @team.unapproached?(@name)
			Recruiter.perform_async(@name, @team_id, Time.now, $history.id.to_s)
			@recruited = true
		end
  end

	def game_over
		$history.reload
		@total = $history.total
		@popular = $history.most_popular
		puts "@popular: #{@popular}"
	end

	private


		def castaway_params
			params.require(:castaway).permit(:name )
		end

		def new_rival
			Recruiter.perform_async(@name, @team_id, Time.now, $history.id.to_s,true)
			@recruited = false
			render :recruit 
		end
end
