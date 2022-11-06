class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/lists" do
    lists = List.all
    lists.to_json(only: [:id, :name])
  end

  get "/lists/:id" do
    list = List.find(params[:id])
    list.to_json(include: :tasks)
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

  get "/lists/:id/tasks" do
    list = List.find(params[:id])
    list.tasks.to_json
  end

  post "/tasks" do
    task = Task.create(name: params[:name], 
      completed: params[:completed],
      list_id: params[:list_id])
    task.to_json
  end

  
end
