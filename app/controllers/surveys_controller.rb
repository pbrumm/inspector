class SurveysController < ApplicationController

  

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.create!(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was created' }
        format.json { render action: 'show', status: :created, location: @survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @survey = find_survey
    @site = find_site
    @items = @survey.items #Item.where(:survey_id => @survey.id)
    #@inspection = Inspection.find_or_create_by(site_id: @site.id) || Struct.new(:id, :site_id).new(id: 1, site_id: @site.id)
    @score = Score.new
  end

  def update
    @survey = find_survey

    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to site_path(Site.find(params[:survey][:scores][:inspection_id])), notice: 'Survey updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @survey = find_survey
    @site = Site.find(params[:site_id])
    @items = Item.where(:id == @survey.id)
    @inspection = Inspection.find(params[:inspection_id])
  end

  private
  def survey_params
    params.require(:survey).permit(
      :name, :active, items_attributes: [:scores, scores_attributes: [:id, :item_id, :score_item, :survey_id, :inspection_id]])
  end

  def find_survey
    Survey.find(params[:id])
  end

  def find_site
    if params[:site_id]
      @site = Site.find(:site_id)
    else
      @site = Struct.new(:name, :id).new("TBD", 1)
      
    end
  end

end