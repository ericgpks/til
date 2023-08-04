module UserPresenter
  def masked_email
    email.gsub(/\A(?<init>.).+(?<tld>\.[^.]+)\z/, '\k<init>***\k<tld>')
  end
end
