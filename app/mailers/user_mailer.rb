class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("user_mailer.account_activation.info")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("user_mailer.password_reset.info")
  end
end
