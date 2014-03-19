class ScoresController < ApplicationController

	def edit
		
	end

	def new
		
	end

	def create
		@score = Score.new(score_params)
    @inspection = Inspection.find(@score.inspection_id)
		if @score.save
			binding.pry
			respond_to do |format|
			format.html {redirect_to inspection_path(@inspection, page: params[:survey_id]), notice: "Scorex was accepted."}
			format.js
			end
			
    else
    	render action: 'new'
		end
	end

	def update
		
	end

	private

  def score_params
    params.require(:score).permit(:score_item, :inspection_id, :item_id, :page, :survey_id)
  end

end