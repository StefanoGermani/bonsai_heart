require 'spec_helper'

describe V1::OrganisationsController do

  describe 'GET index' do
    context 'when user is valid' do

      let(:organisation1) { create(:organisation) }
      let(:organisation2) { create(:organisation) }

      subject { get :index }

      it { should be_success }
      it 'get the requested json' do
        serializer = ActiveModel::ArraySerializer.new [organisation1, organisation2]
        expect(subject.body).to eq("{\"organisations\":#{serializer.to_json}}")
      end
    end

  end

  describe 'GET show' do
    let(:organisation) { create(:organisation) }
    subject { get :show, {:id => organisation.to_param} }
    it 'get the requested organisation as json' do
      serializer = OrganisationSerializer.new organisation
      expect(subject.body).to eq(serializer.to_json)
    end
  end

  describe 'POST create' do
    let(:organisation) { build(:organisation) }

    context 'with valid params' do
      before { expect_any_instance_of(Organisation).to receive(:save) }
      subject { post :create, {organisation: organisation.attributes} }

      it 'returns status 201' do
        expect(subject.status).to eq(201)
      end
    end

    context 'with invalid params' do
      before { allow_any_instance_of(Organisation).to receive(:save).and_return(false) }

      subject { post :create, {organisation: organisation.attributes} }

      it 'returns status 406' do
        expect(subject.status).to eq(406)
      end
    end
  end

  describe 'PUT update' do
    let(:organisation) { create(:organisation) }

    before(:each) do
      organisation.name = 'NewName'
    end

    subject { put :update, {:id => organisation.to_param, organisation: organisation.attributes} }

    context 'with valid params' do
      before { expect_any_instance_of(Organisation).to receive(:update) }

      it { should be_success }

    end

    context 'with invalid params' do
      before { expect_any_instance_of(Organisation).to receive(:update).and_return(false) }

      it 'returns status 406' do
        expect(subject.status).to eq(406)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:organisation) { create(:organisation) }

    subject { delete :destroy, {:id => organisation.to_param} }

    it "redirects to the organisations list" do
      delete :destroy, {:id => organisation.to_param}
      response.should redirect_to(organisations_url)
    end
  end

end
