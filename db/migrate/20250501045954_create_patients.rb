class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table(:patients) do |t|
      t.string(:name)
      t.integer(:age)
      t.date(:appointment_date)
      t.text(:remarks)
      t.references(:receptionist, foreign_key: { to_table: :users }, null: false)
      t.references(:doctor, foreign_key: { to_table: :users }, null: true)

      t.timestamps
    end
  end
end
