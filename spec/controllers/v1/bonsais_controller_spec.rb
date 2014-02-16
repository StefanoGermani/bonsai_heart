require 'spec_helper'

describe V1::BonsaisController do

  describe 'GET index' do
    subject { get :index }

    context 'when user is invalid' do
      it 'return unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end

    context 'when user is valid' do
      login_user
      let(:bonsai1) { create(:bonsai) }
      let(:bonsai2) { create(:bonsai) }

      it { should be_success }
      it 'get the requested json' do
        serializer = ActiveModel::ArraySerializer.new [bonsai1, bonsai2]
        expect(subject.body).to eq("{\"bonsais\":#{serializer.to_json}}")
      end
    end
  end

  describe 'GET show' do
    let(:bonsai) { create(:bonsai) }
    subject { get :show, {:id => bonsai.to_param} }

    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user
      it 'get the requested bonsai as json' do
        serializer = BonsaiSerializer.new bonsai
        expect(subject.body).to eq(serializer.to_json)
      end
    end
  end

  describe 'POST create' do
    let(:bonsai) { build(:bonsai) }
    subject { post :create, {bonsai: bonsai.attributes} }

    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user
      context 'with valid params' do
        before { expect_any_instance_of(Bonsai).to receive(:save).and_call_original }

        it 'returns status 201' do
          expect(subject.status).to eq(201)
        end
      end

      context 'with invalid params' do
        before { allow_any_instance_of(Bonsai).to receive(:save).and_return(false) }

        it 'returns status 400' do
          expect(subject.status).to eq(400)
        end
      end
    end
  end

  describe 'PUT update' do
    let(:bonsai) { create(:bonsai) }

    before { bonsai.name = 'NewName' }

    subject { put :update, {:id => bonsai.to_param, bonsai: bonsai.attributes} }
    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user
      context 'with valid params' do
        before { expect_any_instance_of(Bonsai).to receive(:update).and_call_original }

        it { should be_success }

      end

      context 'with invalid params' do
        before { expect_any_instance_of(Bonsai).to receive(:update).and_return(false) }

        it 'returns status 400' do
          expect(subject.status).to eq(400)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    let(:bonsai) { create(:bonsai) }

    subject { delete :destroy, {:id => bonsai.to_param} }

    context 'when user is invalid' do
      it 'returns unauthorized status' do
        expect(subject.status).to eq(401)
      end
    end
    context 'when user is valid' do
      login_user

      context 'with valid params' do
        before { expect_any_instance_of(Bonsai).to receive(:destroy).and_call_original }
        it 'returns status 204' do
          expect(subject.status).to eq(204)
        end
      end

      context 'with invalid params' do
        before { expect_any_instance_of(Bonsai).to receive(:destroy).and_return(false) }

        it 'returns status 400' do
          expect(subject.status).to eq(400)
        end
      end
    end
  end
end