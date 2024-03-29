class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
