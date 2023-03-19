# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :set_content, except: %i[new create]

  def show; end

  def new
    @subject = Subject.find(params[:subject_id])
    @content = @subject.contents.new
    @new_form = Content::NewForm.new(nil, nil) # エラーメッセージのパーシャルで必要なので置いてるダミーオブジェクト
  end

  def create
    @subject = Subject.find(params[:content][:subject_id])
    @content = Content.new(content_params.merge(subject: @subject))
    @new_form = Content::NewForm.new(@content, recording_method_params)

    if @new_form.save
      flash.now.notice = I18n.t('contents.successfully_created', content: @content.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @content.update(content_params)
      flash.now.notice = I18n.t('contents.successfully_updated', content: @content.name)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @content.destroy

    flash.now.notice = I18n.t('contents.successfully_destroyed', content: @content.name)
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:name, :recording_method_type)
  end

  def recording_method_params
    params.require(:content).permit(
      multi_level: %i[left_end_label right_end_label level],
      binary: %i[false_label truth_label]
    )
  end
end
