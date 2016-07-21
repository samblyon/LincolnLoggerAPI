class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
