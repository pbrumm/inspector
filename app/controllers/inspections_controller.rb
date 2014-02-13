class InspectionsController < ApplicationController

  def show
    @site = Site.find(params[:site_id])
     @inspection = @site.inspections
 end

  def new
    @site = Site.find(params[:site_id])
    @inspection = Inspection.new
    @surveys = Survey.all
  end

  def create
    @site = Site.find(params[:site_id])
    @inspection = @site.inspections.build(inspection_params)
binding.pry
    respond_to do |format|
      if @inspection.save
        format.html { redirect_to site_inspection_path(@site, @inspection), notice: 'Inspection was created'}
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