require 'spec_helper'

describe V1::BonsaisController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get('/bonsais')).to route_to('v1/bonsais#index')
    end

    it 'routes to #show' do
      expect(get('/bonsais/1')).to route_to('v1/bonsais#show', :id => '1')
    end

    it 'routes to #create' do
      expect(post('/bonsais')).to route_to('v1/bonsais#create')
    end

    it 'routes to #update' do
      expect(put('/bonsais/1')).to route_to('v1/bonsais#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(delete('/bonsais/1')).to route_to('v1/bonsais#destroy', :id => '1')
    end

  end
end
