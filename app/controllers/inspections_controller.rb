class InspectionsController < ApplicationController

  def show
    @inspection = find_inspection
    @site = @inspection.site_id
  end

  def new
    @site = Site.find(params[:site_id])
    @inspection = Inspection.new
    @surveys = Survey.all
  end

  private

  def find_inspection
    Inspection.find(params[:id])
  end

end