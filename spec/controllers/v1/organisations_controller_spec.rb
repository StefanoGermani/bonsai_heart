require 'spec_helper'

describe V1::OrganisationsController do

  describe 'GET index' do
    subject { get :index }

    context 'when user is invalid' do
      it 'return unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end

    context 'when user is valid' do
      login_user
      let(:organisation1) { create(:organisation) }
      let(:organisation2) { create(:organisation) }

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

    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user
      it 'get the requested organisation as json' do
        serializer = OrganisationSerializer.new organisation
        expect(subject.body).to eq(serializer.to_json)
      end
    end
  end

  describe 'POST create' do
    let(:organisation) { build(:organisation) }
    subject { post :create, {organisation: organisation.attributes} }

    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user
      context 'with valid params' do
        before { expect_any_instance_of(Organisation).to receive(:save).and_call_original }

        it 'returns status 201' do
          expect(subject.status).to eq(201)
        end
      end

      context 'with invalid params' do
        before { allow_any_instance_of(Organisation).to receive(:save).and_return(false) }

        it 'returns status 400' do
          expect(subject.status).to eq(400)
        end
      end
    end
  end

  describe 'PUT update' do
    let(:organisation) { create(:organisation) }

    before { organisation.name = 'NewName' }

    subject { put :update, {:id => organisation.to_param, organisation: organisation.attributes} }
    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user
      context 'with valid params' do
        before { expect_any_instance_of(Organisation).to receive(:update).and_call_original }

        it { should be_success }

      end

      context 'with invalid params' do
        before { expect_any_instance_of(Organisation).to receive(:update).and_return(false) }

        it 'returns status 400' do
          expect(subject.status).to eq(400)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    let(:organisation) { create(:organisation) }

    subject { delete :destroy, {:id => organisation.to_param} }

    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user

      context 'with valid params' do
        before { expect_any_instance_of(Organisation).to receive(:destroy).and_call_original }
        it 'returns status 204' do
          expect(subject.status).to eq(204)
        end
      end

      context 'with invalid params' do
        before { expect_any_instance_of(Organisation).to receive(:destroy).and_return(false) }

        it 'returns status 400' do
          expect(subject.status).to eq(400)
        end
      end
    end
  end
end