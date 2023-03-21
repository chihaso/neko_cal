# frozen_string_literal: true

# パラメータから適切な記録方式のクラスを選択し、Contentとそれに紐づくRecordingMethodを登録する
class Content::Form
  include ActiveRecord::Validations

  def initialize(content, recording_method_params)
    @content = content
    @generator = RecordingMethod::Generator.new(content, recording_method_params)
  end

  def save
    assign_attributes

    if @content.save
      true
    else
      errors.add(:base, error_messages)
      false
    end
  end

  private

  # Contentとそれに紐づくRecordingMethodにパラメータをアサインする
  def assign_attributes
    if @content.persisted?
      attributes = @generator.attributes
      @content.recording_method.assign_attributes(attributes)
    else
      @generator.generate
    end
  end

  def error_messages
    content_errors = @content.errors.map(&:full_message)
    recording_method_errors = @content.recording_method.errors.map(&:full_message)
    content_errors + recording_method_errors
  end
end
