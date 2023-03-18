# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :subject

  # 記録項目のフォーマットを表すアソシエーション。実際には下記のいずれか一つのみが紐づく。
  has_one :recording_method_multi_level, class_name: 'RecordingMethod::MultiLevel', dependent: :destroy
  has_one :recording_method_binary, class_name: 'RecordingMethod::Binary', dependent: :destroy

  validates :name, presence: true

  def recording_method
    recording_method_multi_level || recording_method_binary
  end
end
