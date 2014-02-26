class InspectionsController < ApplicationController

  def show
   #binding.pry
    @site = Site.find(params[:site_id])
    @inspection = Inspection.find(params[:id])
    @survey = Survey.find(@inspection.survey_id)
    @items = Item.where(:id == @survey.id)
 end

  def new
    @site = Site.find(params[:site_id])
    @inspection = Inspection.new
    @surveys = Survey.all
  end

  def create
    @site = Site.find(params[:inspection][:site_id])
    @inspection = @site.inspections.build(inspection_params)

    respond_to do |format|
      if @inspection.save
        #format.html { redirect_to site_inspection_path(@site, @inspection), notice: 'Inspection was created'}
        format.html { redirect_to  }
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

  private

  def find_inspection
    Inspection.find(params[:id])
  end

  def inspection_params
    params.require(:inspection).permit(:name, :site_id, :survey_id, :user_id)
  end

end