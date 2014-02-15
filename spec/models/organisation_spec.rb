require 'spec_helper'

describe Organisation do
  it 'has a valid factory' do
    expect(build(:organisation)).to be_valid
  end
end
