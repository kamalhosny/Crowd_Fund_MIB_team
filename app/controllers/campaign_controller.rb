class CampaignController < ApplicationController

  def create
    @campaign = current_user.campaigns.create campaign_params
    respond_to do |format|
      format.json  { render :json => @campaign }
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
  end

  def update
    @campaign = Campaign.find(params[:id]).update
    respond_to do |format|
      format.json  { render :json => @campaign }
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.json  { render :json => @campaign }
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :achieved, :goal,
     :video, :status, :profile_photo, :cover_photo, :description_photo)
  end

end
