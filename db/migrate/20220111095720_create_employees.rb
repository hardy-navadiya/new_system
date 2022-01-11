class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.datetime :joining_date
      t.datetime :birth_date

      t.timestamps
    end
  end
end
