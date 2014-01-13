set :stage, :production

server 'us1.jiehan.org', user: 'webapp', roles: %w{web app db}
