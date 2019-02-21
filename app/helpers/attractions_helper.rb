module AttractionsHelper
  def admin_index(user)
    if user.admin
      link_to "New Attraction", new_attraction_path
    end
  end
end
