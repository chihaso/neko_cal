# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :subject

  # 記録項目のフォーマットを表すアソシエーション。実際には下記のいずれか一つのみが紐づく。
  has_one :recording_method_multi_level, class_name: 'RecordingMethod::MultiLevel', dependent: :destroy, autosave: true
  has_one :recording_method_binary, class_name: 'RecordingMethod::Binary', dependent: :destroy, autosave: true

  validates :name, presence: true

  attribute :recording_method_type, :string # 記録項目を表す文字列 例) 'multi_level'

  def save_with_recording_method(recording_method_params)
    association_name = "recording_method_#{recording_method_type}"
    recording_method_class = "RecordingMethod::#{recording_method_type.camelize}".constantize
    recording_method_attributes = recording_method_params[recording_method_type.to_sym].merge(content_id: id)
    recording_method_instance = recording_method_class.new(recording_method_attributes)

    send("#{association_name}=", recording_method_instance)
    save
  end

  def recording_method
    recording_method_multi_level || recording_method_binary
  end
end
