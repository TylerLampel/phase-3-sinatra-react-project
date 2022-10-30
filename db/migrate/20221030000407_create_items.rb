class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :task
      t.string :importance
      t.boolean :completed
      t.integer :list_id
    end
  end
end
