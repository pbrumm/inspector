class ItemsController < ApplicationController

	def new
	  @survey = Survey.find(params[:survey_id])
	  @item = Item.new

	end

	def create
	  @survey = Survey.find(params[:item][:survey_id])
	  @item = @survey.items.create(item_params)

	  respond_to do |format|
	  	if @item.save
	  	  format.html { redirect_to item_path(@item), notice: 'Item was created' }
	  	  format.json { render action: 'show', status: :created, location: @item }
	  	else
	  	  format.html { render action: 'new' }
	  	  format.json { render json: @item.errors, status: :unproccessable_entity }
	  	end
	  end
	end

	def show
	  @item = Item.find(params[:id])	  
	  @survey = Survey.find(@item.survey_id)

	end

	def index
		@items = Item.all
	end

  private

  def item_params
  	params.require(:item).permit(:name, :survey_id, :category, :sub_category, :explanation, :scoring, :high_score, :all_or_nothing)
  end

end