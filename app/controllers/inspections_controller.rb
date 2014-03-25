class InspectionsController < ApplicationController

  include SurveyHelper
 

  def show
   #binding.pry
    #@site = Site.find(params[:site_id])
    @inspection = Inspection.find(params[:id])
    @site = Site.find(@inspection.site_id)
    @survey = Survey.find(@inspection.survey_id)
    @items = Item.where(:id == @survey.id).order("sub_category").page(params[:page]).per_page(1)
    @general = General.new
    @score = @inspection.scores.build
  end

  def new
    @site = Site.find(params[:site_id]) # || Site.find(parms[:inspection][:site_id])
    @inspection = Inspection.new
    #@inspection.scores.build
    @surveys = Survey.all
  end

  def create
    @site = Site.find(params[:inspection][:site_id])
    @inspection = Inspection.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        #format.html { redirect_to site_inspection_path(@site, @inspection), notice: 'Inspection was created'}
        
        format.html { redirect_to edit_inspection_path(@inspection), notice: 'Inspection was created.' }
        format.json { render action: 'show', status: :created, location: @inspection }
      else
        format.html { render action: 'new' }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def index   
    @inspections = Inspection.all
    @site = Site.find(params[:site_id]) || Site.find(parms[:inspection][:site_id])
  end

  def edit
    @inspection = Inspection.find(params[:id])
    @site = Site.find(@inspection.site_id)
    @items = Item.where(survey_id: @inspection.survey_id)
  end

  def update
    @inspection = find_inspection

    respond_to do |format|
      if @inspection.update_attributes(inspection_params)

        format.html {redirect_to edit_inspection_path(@inspection), notice: 'Score was updated'}
        format.json {head :no_content}
        format.js
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
    params.require(:inspection).permit(:name, :site_id, :user_id, :survey_id, scores_attributes: [:id, :score_item, :item_id])
  end

end