class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/users/:username" do
    user = User.find_by_username(params[:username])
    user.to_json(include: [:lists])
  end

end
