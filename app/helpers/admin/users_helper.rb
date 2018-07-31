module Admin::UsersHelper
  def value_select_tag
    if current_user.admin?
      [User.roles.key(0)]
    else
      [User.roles.key(0), User.roles.key(1)]
    end
  end

  def check_to_view_edit_tag user
    edit_action_tag edit_admin_user_path(user) if current_user?(user) ||
                                                  current_user.superadmin?
  end

  def check_to_view_delete_tag user
    return if current_user?(user)
    delete_action_tag admin_user_path(user) if user.user? ||
                                               current_user.superadmin?
  end
end
