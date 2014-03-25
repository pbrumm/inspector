class ScoresController < ApplicationController

	def edit
		
	end

	def new
		
	end

	def create
		@score = Score.new(score_params)
    @inspection = Inspection.find(@score.inspection_id)
		if @score.save
			#binding.pry
			respond_to do |format|
			format.html {redirect_to inspection_path(@inspection, page: @score.survey_id), notice: "Score was accepted."}
			format.js
			end
			
    else
    	render action: 'new'
		end
	end

	def update
		@score = Score.where(inspection_id: score_params[:inspection_id], item_id: score_params[:item_id]).first

    respond_to do |format|
      if @score.update_attributes(score_params)

        format.html {redirect_to edit_inspection_path(@inspection), notice: 'Score was updated'}
        format.json {head :no_content}
        format.js
      else
        format.html { render action: 'edit'}
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end

	end

	private

  def score_params
    params.require(:score).permit(:score_item, :inspection_id, :item_id, :page, :survey_id)
  end

end