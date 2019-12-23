require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '#address' do
  #user_idがないと登録できない
  it "is valid with user_id" do
    address = build(:address)
    expect(address).to be_valid
  end

  it "is invalid with user_id" do
    address = build(:address, user_id: "")
    expect(address.errors[:user_id]).to include()
  end

  #phone_numberが10~11桁か
  it "電話番号が10桁か" do
    address = build(:address)
    address.valid?
    expect(address).to be_valid
  end
  it "電話番号が11桁か " do
    address = build(:address, phone_number: "12345678903")
    address.valid?
    expect(address).to be_valid
  end
  it "電話番号が9桁以下 " do
    address = build(:address, phone_number: "1111111")
    address.valid?
    expect(address.errors[:phone_number]).to include("の入力が正しくありません")
  end
end
