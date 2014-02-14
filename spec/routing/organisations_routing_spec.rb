require 'spec_helper'

describe API::V1::OrganisationsController do
  describe 'routing' do

    before { request.headers['HTTP_ACCEPT'] = 'application/vnd.rikku+json; version=1'}

    it 'routes to #index' do
      get('/organisations').should route_to('api/v1/organisations#index')
    end

    it 'routes to #show' do
      get('organisations/1').should route_to('api/v1/organisations#show', :id => '1')
    end

    it 'routes to #create' do
      post('organisations').should route_to('api/v1/organisations#create')
    end

    it 'routes to #update' do
      put('organisations/1').should route_to('api/v1/organisations#update', :id => '1')
    end

    it 'routes to #destroy' do
      delete('/organisations/1').should route_to('api/v1/organisations#destroy', :id => '1')
    end

  end
end
