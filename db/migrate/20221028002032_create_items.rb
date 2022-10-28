class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :task
      t.boolean :completed
      t.integer :user_id
  end
end
