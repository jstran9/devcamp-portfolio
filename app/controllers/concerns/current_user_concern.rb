module CurrentUserConcern
  extend ActiveSupport::Concern

  # we want this here because there is always going to be a current user and devise
  # is restricting it so it's only available to devise users (not guest users for example)
  def current_user
    # if a user is logged in we just use devise's implementation.
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest@example.com"
                  )
  end
end