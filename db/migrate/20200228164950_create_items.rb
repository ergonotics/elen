class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.string :comment
      t.integer :type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
