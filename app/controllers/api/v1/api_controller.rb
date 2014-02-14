class API::V1::ApiController < ApplicationController
  respond_to :json

  protected

  def success_json
    {success: 'OK'}
  end

  def failed_json
    {failed: 'FAILED'}
  end
end