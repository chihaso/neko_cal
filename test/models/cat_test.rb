# frozen_string_literal: true

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  test '猫の登録時にデフォルトの記録対象を設定する' do
    new_cat = Cat.create!(name: '新しい子')

    new_cat.subjects.pluck(:name).each do |name|
      assert_includes(%w[うんち おしっこ], name)
    end
  end
end
