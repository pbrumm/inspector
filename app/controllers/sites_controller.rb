class SitesController < ApplicationController
  #before_filter :authenticate_user!
  before_filter do
  	authorize! :manage, Site
  end

  def index
    #authorize! :index, @user, :message => "Not authorized as an administrator."
    @sites = Site.all
  end

  def new
    #authorize! :index, @user, :message => "Not authorized as an administrator."
    @site = Site.new
  end

  def create
    #authorize! :index, @user, :message => "Not authorized as an administrator."
    @site = Site.create!(site_params)
  	
  	respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @site = find_site
    @inspections = Inspection.where(site_id: @site.id)
    
    #params.require(:post).permit(:site_id).merge(site_id: @site.id)
  end

  def edit
    #authorize! :index, @user, :message => "Not authorized as an administrator."
    @site = find_site
  end

  def update
    #authorize! :index, @user, :message => "Not authorized as an administrator."
    @site = find_site
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was updated'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit'}
        format.json { render json: @site.errors, status: :unproccessable_entity}
      end
    end
  end

  private
  def site_params
    params.require(:site).permit(:name, :site_type, :site_number)
  end

  def find_site
    Site.find(params[:id])
  end

end

