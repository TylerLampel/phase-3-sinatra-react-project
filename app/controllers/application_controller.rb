class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    ["Good luck with your project!"].to_json
  end

  get "/lists" do
    lists = List.all
    lists.to_json
  end

  post "/lists" do
    list = List.create(name: params[:name])
    list.to_json
  end

  post "/tasks" do
    task = Task.create(task: params[:task],
      importance: params[:importance],
      list_id: params[:list_id])
    task.to_json(include: { list: {only: [:list]} })
  end

  get "/tasks" do
    tasks = Task.all.order(:list_id)
    tasks.to_json(include: {list: {only: [:list]} })
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
