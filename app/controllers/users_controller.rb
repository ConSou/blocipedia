class UsersController < ApplicationController

  def downgrade_user

    current_user.wikis.where(private: true).update_all(private: false)
    current_user.standard!

    flash[:notice] = "Your account has been downgraded to standard and all your private wikis are public"
    redirect_to wikis_path
  end

end
