class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :load_current_turn, only: [:edit, :update]
  
  def create
    super do |user|
      if user.persisted?
        user.update(is_admin: true, order_number: 0)
      end
    end
  end

  private
    def load_current_turn
      @user_turn_to_day = Turn.for_organization(current_user.organization).from_current_date.first
    end
end