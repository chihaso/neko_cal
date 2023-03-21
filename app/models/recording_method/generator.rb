# frozen_string_literal: true

# コントローラに渡されたパラメータからRecordingMethodを生成するためのクラス
class RecordingMethod::Generator
  def initialize(content, params)
    @content = content
    @params = params
  end

  # コントローラに渡されたパラメータから指定されたクラスの記録方式を生成し、contentに紐づける
  def generate
    @content.send("#{association_name}=", recording_method_class.new(attributes))
  end

  def attributes
    @params[recording_method_type].merge(content: @content)
  end

  private

  def recording_method_class
    "RecordingMethod::#{recording_method_type.camelize}".constantize
  end

  def association_name
    "recording_method_#{recording_method_type}"
  end

  # 記録項目を表す文字列 例) 'multi_level'
  def recording_method_type
    @params[:recording_method_type] || @content.recording_method.to_s
  end
end
