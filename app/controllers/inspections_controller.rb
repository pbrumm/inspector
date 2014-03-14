class InspectionsController < ApplicationController

  def show
   #binding.pry
    #@site = Site.find(params[:site_id])
    @inspection = Inspection.find(params[:id])
    @site = Site.find(@inspection.site_id)
    @survey = Survey.find(@inspection.survey_id)
    @items = Item.where(:id == @survey.id).order("sub_category").page(params[:page])
    @general = General.new
 end

  def new
    @site = Site.find(params[:site_id]) # || Site.find(parms[:inspection][:site_id])
    @inspection = Inspection.new
    #@inspection.scores.build
    @surveys = Survey.all
  end

  def create
    @site = Site.find(params[:inspection][:site_id])
    @inspectionNew = Inspection.new(inspection_params)
    @inspection = Inspection.find(params[:id])
    binding.pry
    respond_to do |format|
      if @inspection.save
        #format.html { redirect_to site_inspection_path(@site, @inspection), notice: 'Inspection was created'}
        
        format.html { redirect_to inspection_edit_path(@inspection, page: params[:page]), notice: 'Inspection was created.' }
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
    params.require(:inspection).permit(:name, :site_id, :user_id, :item_id, scores_attributes: [:id, :score_item, :item_id])
  end

end