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

  post "/tasks" do 
  # grab url and post to list in params (list_id: params[:list_id])
    task = Task.create(name: params[:name],
    completed: params[:completed])
  end

  delete "/lists/:id" do
    list = List.find(params[:id])
    list.destroy
    list.to_json
  end

  delete "/tasks/:id" do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end



  get "/lists/:id/tasks" do
    list = List.find(params[:id])
    tasks = Task.all
    tasks.to_json
  end

  post "/lists/:id/tasks" do
    list = List.find(params[:id])
    task = Task.create(name: params[:name],
      completed: params[:completed])
    task.to_json
  end

  patch "/lists/:id" do
    task = Task.find(params[:id])
    task.update(task: params[:task])
    task.to_json
  end

  

end
