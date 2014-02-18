require 'spec_helper'

describe HomeController do


  describe "GET 'index'" do
    subject { get :index }
    context 'when user is not logged in' do

      it { should be_success }
      it { expect(subject).to render_template  :index}
      it { subject and expect(assigns[:user]).to be_a_new(User) }
    end

    context 'when user is not logged in' do
      login_user

      it { expect(subject).to render_template  'ember_app/index'}
    end
  end


end
