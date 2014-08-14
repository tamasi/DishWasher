class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super do |user|
      if user.persisted?
        user.update(is_admin: true, order_number: 0)
      end
    end
  end
end