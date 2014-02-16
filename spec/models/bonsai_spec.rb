require 'spec_helper'

describe Bonsai do
  it 'has a valid factory' do
    expect(build(:bonsai)).to be_valid
  end
end
