class ItemsController < ApplicationController

	def new
	  @survey = find_survey
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
	  @item = find_item  
	  @survey = Survey.find(@item.survey_id)

	end

	def index
		@items = Item.all
	end

	def edit
		@item = find_item
		@survey = find_survey
	end

  private

  def item_params
  	params.require(:item).permit(:name, :survey_id, :category, :sub_category, :explanation, :scoring, :high_score, :all_or_nothing)
  end

  def find_item
  	Item.find(params[:id])
  end

  def find_survey
  	Survey.find(@item.survey_id)
  end

end