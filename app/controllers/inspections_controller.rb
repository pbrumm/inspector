class InspectionsController < ApplicationController

  def show
   #binding.pry
    #@site = Site.find(params[:site_id])
    @inspection = Inspection.find(params[:id])
    @site = Site.find(@inspection.site_id)
    @survey = Survey.find(@inspection.survey_id)
    @items = Item.where(:id == @survey.id)
 end

  def new
    @site = Site.find(params[:site_id])
    @inspection = Inspection.new
    @inspection.scores.build
    @surveys = Survey.all
  end

  def create
    #@site = Site.find(params[:inspection][:site_id])
    @inspection = Inspection.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        #format.html { redirect_to site_inspection_path(@site, @inspection), notice: 'Inspection was created'}
        format.html { redirect_to @inspection, notice: 'Inspection was created.' }
        format.json { render action: 'show', status: :created, location: @inspection }
      else
        format.html { render action: 'new' }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    
    @inspections = Inspection.all
  end

  def update
    @inspection = find_inspection

    respond_to do |format|
      if @inspection.update_attributes(inspection_params)
        format.html {redirect_to @inspection, notice: 'Inspection was updated'}
        format.json {head :no_content}
      else
        format.html { render action: 'edit'}
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_inspection
    Inspection.find(params[:id])
  end

  def inspection_params
    params.require(:inspection).permit(:name, :site_id, :survey_id, :user_id, scores_attributes: [:id, :item_id, :score_item, :survey_id])
  end

end