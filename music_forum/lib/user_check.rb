# frozen_string_literal: true

class UserCheck
  def check(login)
    secret_check(login)
  end

  private

  def secret_check(login)
    login.eql?('alice480')
  end

end
