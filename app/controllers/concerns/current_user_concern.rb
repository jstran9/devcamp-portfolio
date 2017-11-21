module CurrentUserConcern
  extend ActiveSupport::Concern

  # we want this here because there is always going to be a current user and devise
  # is restricting it so it's only available to devise users (not guest users for example)
  def current_user
    # if a user is logged in we just use devise's implementation.
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end