class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    ["Good luck with your project!"].to_json
  end

  post "/items" do
    item = Item.create(task: params[:task],
      importance: params[:importance],
      list_id: params[:list_id])
    item.to_json(include: { list: {only: [:list]} })
  end

  get "/items" do
    items = Item.all.order(:list_id)
    items.to_json(include: {list: {only: [:list]} })
  end

  patch "/items/:id" do
    item = Item.find(params[:id])
    item.update(task: params[:task])
    item.to_json(include: { list: {only: [:list]} })
  end

  delete "/items/:id" do
    item = Item.find(params[:id])
    item.destroy
    item.to_json
  end

end
