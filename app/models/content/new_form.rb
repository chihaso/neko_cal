# frozen_string_literal: true

# パラメータから適切な記録方式のクラスを選択し、Contentとそれに紐づくRecordingMethodを登録する
class Content::NewForm
  include ActiveRecord::Validations

  def initialize(content, recording_method_params)
    @content = content
    @recording_method_params = recording_method_params
  end

  def save
    @content.send("#{association_name}=", recording_method_instance)

    if @content.save
      true
    else
      content_errors = @content.errors.map(&:full_message)
      recording_method_errors = @content.recording_method.errors.map(&:full_message)

      errors.add(:base, content_errors + recording_method_errors)
      false
    end
  end

  private

  def association_name
    "recording_method_#{@content.recording_method_type}"
  end

  def recording_method_class
    "RecordingMethod::#{@content.recording_method_type.camelize}".constantize
  end

  def recording_method_instance
    attributes = @recording_method_params[@content.recording_method_type].merge(content: @content)
    recording_method_class.new(attributes)
  end
end
