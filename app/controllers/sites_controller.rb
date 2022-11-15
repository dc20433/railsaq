class SitesController < ApplicationController
  def index
    session[:user_id] = nil
  end

  def about
    flash.now[:notice] = "This is a notice"
    flash.now[:alert] = "This is an alert"
  end
end
