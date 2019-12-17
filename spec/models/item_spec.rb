require 'rails_helper'


  
describe '#item' do
    # 空では登録できない 
    it "is invalid without a name" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include()
      end

    it "is invalid without a price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include()
    end

    it "is invalid without a description" do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include()
    end

    it "is invalid without a status" do
        item = build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include()
    end

    it "is invalid without a burden" do
        item = build(:item, burden: nil)
        item.valid?
        expect(item.errors[:burden]).to include()
    end

    it "is invalid without a send_method" do
        item = build(:item, send_method: nil)
        item.valid?
        expect(item.errors[:send_method]).to include()
    end

    it "is invalid without a region" do
        item = build(:item, region: nil)
        item.valid?
        expect(item.errors[:region]).to include()
    end

    it "is invalid without a created_at" do
        item = build(:item, created_at: nil)
        item.valid?
        expect(item.errors[:created_at]).to include()
    end

    it "is invalid without a updated_at" do
        item = build(:item, updated_at: nil)
        item.valid?
        expect(item.errors[:updated_at]).to include()
    end
    # ユーザーidが空の場合、アイテムを持っている
    it "is invalid without a buyer_id" do
        item = build(:item, buyer_id: nil)
        item.valid?
        expect(item.errors[:buyer_id]).to include()
    end
    # ユーザーidが空じゃない場合、アイテムは持っていない
    it "is invalid without a buyer_id" do
        item = build(:item, buyer_id: true)
        item.valid?
        expect(item.errors[:buyer_id]).to include()
    end
    it "is invalid without a seler_id" do
        item = build(:item, seler_id: nil)
        item.valid?
        expect(item.errors[:seler_id]).to include()
    end
    
    # nameが40文字以下か
        # 40文字
    it "is valid with a name that has less than 40 characters " do
        item = build(:item, name: "book",buyer_id:"1" ,seler_id:"2")
        item.valid?
        expect(item).to be_valid
    end
    # 41文字
    it "is invalid with a name that has more than 40 characters" do
        item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") 
        item.valid?
        expect(item.errors[:name]).to include()
    end
    # descriptionが１０００文字以下か
    #  1000文字
    it "is valid with a description that has less than 1000 characters" do
        item = build(:item) 
        expect(item).to be_valid
    end
    # priceが9999999円以上の場合
    it "is invalid price is too much maximum 9999999" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include()
    end
     #priceが9999999円の場合
    it "is valid price is too much maximum 9999999" do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
    end
    #priceが300円以下の場合
    it "is invalid with a that has less than 300" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include()
    end
    #priceが300円の場合
    it "is valid with a that has less than 300" do
        item = build(:item, price: 300)
        expect(item).to be_valid
    end
end

