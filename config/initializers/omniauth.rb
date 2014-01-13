Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, :name => 'peddie', :identifier => 'https://www.google.com/accounts/o8/site-xrds?hd=peddie.org'
end
