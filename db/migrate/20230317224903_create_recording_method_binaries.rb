class CreateRecordingMethodBinaries < ActiveRecord::Migration[7.0]
  def change
    create_table :recording_method_binaries do |t|
      t.references :content, null: false, foreign_key: true
      t.string :false_label, null: false, comment: '偽のラベル'
      t.string :truth_label, null: false, comment: '真のラベル'

      t.timestamps
    end
  end
end
