class ScoresController < ApplicationController

	def edit
		
	end

	def new
		
	end

	def create
		@score = Score.new(score_params)
    @inspection = Inspection.find(@score.inspection_id)
		if @score.save
			redirect_to inspection_path(@inspection), notice: "Score was accepted."
    else
    	render action: 'new'
		end
	end

	def update
		
	end

	private

  def score_params
    params.require(:general).permit(:score_item, :type, :inspection_id, :item_id)
  end

end