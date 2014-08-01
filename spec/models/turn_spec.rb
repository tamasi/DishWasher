require 'rails_helper'

describe Turn, :type => :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end