class HomeController < ApplicationController

  before_action :open_ember_app_if_user_signed_in

  def index
    @user = User.new
  end


  private

  def open_ember_app_if_user_signed_in
    render 'ember_app/index', layout: false if user_signed_in?
  end

end
