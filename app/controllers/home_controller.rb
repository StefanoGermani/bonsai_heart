class HomeController < ApplicationController

  before_action :redirect_if_user_already_logged

  def index
  end

  private

  def redirect_if_user_already_logged
    render 'ember_app/index', layout: false if user_signed_in?
  end
end
