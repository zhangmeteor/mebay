class AdsController < ApplicationController
  before_filter :check_logged_in, :only => [:edit, :update, :destroy]
  def show
    @ad = Ad.find(params[:id])
  end
  def index
    @ads = Ad.find(:all)
  end
  def create
    params.permit!
    @ad=Ad.new(params[:ad])
    @ad.save
    redirect_to "/ads/#{@ad.id}"
  end
  def new
    @ad = Ad.new
  end
  def edit
    @ad = Ad.find(params[:id])
  end
  def update
    params.permit!
    @ad = Ad.find(params[:id])
    @ad.update_attributes(params[:ad])
    redirect_to "/ads/#{@ad.id}"
  end
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to '/ads/'
  end
  private
  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username,password|
      username == "admin" && password == "1pass"
    end
  end
end
