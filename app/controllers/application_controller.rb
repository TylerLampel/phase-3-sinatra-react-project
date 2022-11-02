class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/lists" do
    lists = List.all
    lists.to_json
  end

  get "/lists/:id" do
    list = List.find(params[:id])
    list.to_json(include:{ tasks: { include: :list_id}})
  end

  post "/lists" do
    list = List.create(name: params[:name])
    list.to_json
  end

  delete "/lists/:id" do
    list = List.find(params[:id])
    list.destroy
    list.to_json
  end

end
