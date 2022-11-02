class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/lists" do
    lists = List.all
    lists.to_json(include: :tasks)
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

  get "/tasks/:id" do
    list = List.find(params [:id])
    tasks = Task.all(params[:list_id])
    tasks.to_json
  end

end
