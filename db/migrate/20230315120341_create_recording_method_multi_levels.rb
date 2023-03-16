class CreateRecordingMethodMultiLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :recording_method_multi_levels do |t|
      t.references :content, null: false, foreign_key: true
      t.string :right_end_label, null: false, comment: '右端のラベル'
      t.string :left_end_label, null: false, comment: '左端のラベル'
      t.integer :level, deafult: 10, null: false, comment: '段階数'

      t.timestamps
    end
  end
end
