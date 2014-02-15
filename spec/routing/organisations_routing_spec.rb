require 'spec_helper'

describe V1::OrganisationsController do
  describe 'routing' do

    #before { request.headers['HTTP_ACCEPT'] = 'application/vnd.rikku+json; version=1'}

    it 'routes to #index' do
      expect(get('/organisations')).to route_to('v1/organisations#index')
    end

    it 'routes to #show' do
      expect(get('/organisations/1')).to route_to('v1/organisations#show', :id => '1')
    end

    it 'routes to #create' do
      expect(post('/organisations')).to route_to('v1/organisations#create')
    end

    it 'routes to #update' do
      expect(put('/organisations/1')).to route_to('v1/organisations#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(delete('/organisations/1')).to route_to('v1/organisations#destroy', :id => '1')
    end

  end
end
