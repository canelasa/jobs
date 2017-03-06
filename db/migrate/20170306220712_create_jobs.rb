class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :title
      t.text :description
      t.text :responsibilities
      t.text :requirements
      t.text :skills
      t.string :majors
      t.integer :user_id
      t.timestamps
    end
    add_index :jobs, :user_id
  end
end
