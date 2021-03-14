class CreatePriorities < ActiveRecord::Migration[6.0]
  def change
    create_table :priorities do |t|
      t.string :description
      t.date :day
      t.integer :user_id
      t.boolean :alert_sent, { :default => false }

      t.timestamps
    end
  end
end
