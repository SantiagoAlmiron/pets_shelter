module UserHelper
  def user_role_traduction(user)
    I18n.t("user.roles.#{user.role}")
  end

  def user_role_options
    User.roles.keys.map do |role|
      [I18n.t("user.roles.#{role}"), role]
    end
  end

  def select_users_options
    User.not_blocked.map do |user|
      [user.email, user.id]
    end
  end
end