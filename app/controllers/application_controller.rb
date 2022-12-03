class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/lists" do
    all_lists
  end

  post "/lists" do
    list = List.create(name: params[:name])
    all_lists
  end

  post "/tasks/:list_id" do
    task = Task.create(
      name: params[:name], 
      completed: params[:completed],
      list_id: params[:list_id]
      )
      all_lists
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
    all_lists
  end

  patch "/lists/:list_id" do
    find_list
    @list.update(name: params[:name])
    all_lists
  end

  patch "/tasks/:task_id" do
    task= Task.find(params[:task_id])
    task.update(name: params[:name])
    all_lists
  end

  private

    def find_list
      @list = List.find(params[:list_id])
    end
  
    def all_lists
      lists = List.all
      lists.to_json(include: :tasks)
    end
end
