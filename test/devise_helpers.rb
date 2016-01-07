module DeviseHelpers
  include Devise::TestHelpers
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in users(user)
  end
end
