module UsersHelper
  def display(user)
    if user.admin
      "ADMIN"
    else
      render partial: "/users/show_data", locals: {user: user}
    end
  end
end
