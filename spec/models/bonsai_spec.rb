# == Schema Information
#
# Table name: bonsais
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Bonsai do
  it 'has a valid factory' do
    expect(build(:bonsai)).to be_valid
  end
end
