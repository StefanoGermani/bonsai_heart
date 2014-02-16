class CustomFailure < Devise::FailureApp

  def redirect_url
    login_page_url
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
        self.status = :unauthorized
        self.content_type = 'json'
    end
  end

end