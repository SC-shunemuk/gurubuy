require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿ができる場合' do
      it 'textがあれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿ができない場合' do
      it 'textがないと投稿できない' do
        @comment.text = nil
        @comment.valid?
      end
    end
  end
end
