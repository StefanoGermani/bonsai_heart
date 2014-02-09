class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :open_ember_app_if_user_signed_in

  private

  def open_ember_app_if_user_signed_in
    render 'ember_app/index', layout: false if user_signed_in?
  end
end
