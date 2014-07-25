class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super do |user|
      if user.persisted?
        user.update(is_admin: true)
      end
    end
  end
end