class Error

  def unauthorized
    render_json(401, "Unauthorized")
  end

  def authentication_error(params)
    error_message = find_authentication_error(params)
    render_json(400, error_message)
  end

  def bad_credentials
    render_json(400, "credentials are bad.")
  end

  def render_json(code, message)
    {status: "error", code: code, message: message}
  end

  def find_authentication_error(params)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      "email, password, and password confirmation must be present."
    elsif User.where(email: params[:email]).exists?
      "an account already exists for that email."
    elsif params[:password] != params[:password_confirmation]
      "password and password confirmation must match."
    end
  end
end
