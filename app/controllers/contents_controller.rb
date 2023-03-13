# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :set_content, except: %i[new create]

  def new
    @subject = Subject.find(params[:subject_id])
    @content = @subject.contents.new
  end

  def create
    @subject = Subject.find(params[:content][:subject_id])
    @content = @subject.contents.new(content_params)

    if @content.save
      flash.now.notice = I18n.t('contents.successfully_created', content: @content.name)
    else
      render :new, status: :unprocessable_entity, alart: I18n.t('contents.failed_to_create')
    end
  end

  # def edit; end

  # def update
  #   if @content.update(content_params)
  #     flash.now.notice = I18n.t('contents.successfully_updated', content: @content.name)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @content.destroy

  #   flash.now.notice = I18n.t('contents.successfully_destroyed', content: @content.name)
  # end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:name)
  end
end
