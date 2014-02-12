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
  end

  private
  def survey_params
    params.require(:survey).permit(:name, :active)
  end

  def find_survey
    Survey.find(params[:id])
  end


end