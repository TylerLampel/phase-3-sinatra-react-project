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



  get "/tasks" do
    tasks = Task.all
    tasks.to_json
  end

  post "/tasks/:id" do
    list = List.find_by_id(params[:id])
    task = Task.create(name: params[:name],
      list_id: params[:list_id])
    task.to_json
  end

  patch "/tasks/:id" do
    task = Task.find(params[:id])
    task.update(task: params[:task])
    task.to_json(include: { list: {only: [:list]} })
  end

  delete "/tasks/:id" do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

end
