class CreateRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :registers do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :month
      t.string :highschool
      t.string :college
      t.string :location
      t.integer :years
      t.string :major
      t.string :company_name
      t.string :job_title
      t.string :description
      t.string :goals
      t.integer :user_id
      t.integer :job_id
      t.timestamps
    end

    add_index :registers, [:user_id, :job_id]
    add_index :registers, :job_id
  end
end
