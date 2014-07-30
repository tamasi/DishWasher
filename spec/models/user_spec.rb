require 'rails_helper'

describe User do

  describe 'scopes' do
    describe '.from_organization' do
      before do
        @user         = FactoryGirl.create(:user)
        @another_user = FactoryGirl.create(:user)
        @organization = @user.organization
      end

      it 'returns users from organization' do
        result = User.from_organization(@organization)
        expect(result).to include(@user)
      end

      it 'does not returns users from other organizations' do
        result = User.from_organization(@organization)
        expect(result).not_to include(@another_user)
      end
    end

    describe '.org' do
      before do
        @user = FactoryGirl.create(:user)
        @another_user = FactoryGirl.create(:user)
      end

      it 'does return users from organization ii' do
        result = User.org(@user)
        expect(result).to include(@user)
      end

      it 'does not return this user in organization' do
        result = User.org(@user)
        expect(result).not_to include(@another_user)
      end
    end
  end

end
