class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/lists" do
    lists = List.all
    lists.to_json
  end

  get "/lists/:list_id" do
    find_list
    @list.to_json(include: :tasks)
end

  post "/lists" do
    list = List.create(name: params[:name])
    list.to_json
  end

  post "/tasks/:list_id" do
    task = Task.create(
      name: params[:name], 
      completed: params[:completed],
      list_id: params[:list_id]
      )
    find_list
    @list.to_json(include: :tasks)
  end

  delete "/lists/:list_id" do
    find_list
    @list.destroy
    lists = List.all
    lists.to_json
  end

  delete "/lists/:list_id/tasks/:task_id" do
    task = Task.find(params[:task_id])
    task.destroy
    find_list
    @list.to_json(include: :tasks)
  end

  patch "/lists/:list_id" do
    find_list
    @list.update(name: params[:name])
    @list.to_json(include: :tasks)
  end

  patch "/lists/:list_id/tasks/:task_id" do
    task= Task.find(params[:task_id])
    task.update(name: params[:name])
    find_list
    @list.to_json(include: :tasks)
  end

  private

    def find_list
      @list = List.find(params[:list_id])
    end

  
end
