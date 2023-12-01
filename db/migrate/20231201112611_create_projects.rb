class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.boolean :create_scene_manager, default: true

      t.timestamps
    end
  end
end
