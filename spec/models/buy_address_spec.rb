require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
      sleep 0.1 
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できないこと' do
        @buy_address.zip_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ文字列でないと保存できないこと' do
        @buy_address.zip_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numが空だと保存できないこと' do
        @buy_address.house_num = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @buy_address.phone = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9桁以下では保存できないこと' do
        @buy_address.phone = '090123456'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone is invalid.')
      end
      it 'phoneが12桁以上では保存できないこと' do
        @buy_address.phone = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone is invalid.')
      end
      it 'phoneが全角数字だと保存できないこと' do
        @buy_address.phone = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone is invalid.')
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
