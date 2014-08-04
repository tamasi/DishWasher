class Users::SessionsController < Devise::SessionsController

  def create
    super do |user|
      organization = user.organization
      if user.is_admin? && organization.users.count < 2
        redirect_to new_admin_user_path
        return
      end
    end
  end
end