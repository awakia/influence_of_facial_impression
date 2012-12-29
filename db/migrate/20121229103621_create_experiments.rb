class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.references :user
      t.integer :share
      t.integer :face
      t.boolean :accept
      t.integer :response_time

      t.timestamps
    end
    add_index :experiments, :user_id
  end
end
