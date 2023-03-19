# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :set_subject, except: %i[new create]

  def show; end

  def new
    @cat = Cat.find(params[:cat_id])
    @subject = @cat.subjects.new
  end

  def create
    @cat = Cat.find(params[:subject][:cat_id])
    @subject = @cat.subjects.new(subject_params)

    if @subject.save
      flash.now.notice = I18n.t('subjects.successfully_created', subject: @subject.name)
    else
      render :new, status: :unprocessable_entity, alart: I18n.t('subjects.failed_to_create')
    end
  end

  def edit; end

  def update
    if @subject.update(subject_params)
      flash.now.notice = I18n.t('subjects.successfully_updated', subject: @subject.name)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy

    flash.now.notice = I18n.t('subjects.successfully_destroyed', subject: @subject.name)
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
