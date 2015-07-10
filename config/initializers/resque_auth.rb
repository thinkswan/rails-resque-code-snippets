Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == Rails.application.secrets.resque_admin_password
end
