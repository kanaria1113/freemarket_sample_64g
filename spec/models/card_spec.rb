require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '#card' do
  # 登録可能（全項目あり）
  it "is valid with all properties" do
    card = build(:card)
    expect(card).to be_valid
  end
  #登録できない(１部項目なし)
  it "is invalid without all properties" do
    card = build(:card, name: "")
    expect(card.errors[:number]).to include()
  end
  #カードナンバーは14または16文字でないと登録できない
  it "is valid with card's number of characters 14" do
    card = build(:card)
    expect(card).to be_valid
  end
  it "is valid with card number of characters 16" do
    card = build(:card, number: "3566002020360505	")
    expect(card).to be_valid
  end

  it "is invalid with card number of characters 14 or 16" do
    card = build(:card, number: "1234567324")
    expect(card.errors[:number]).to include()
  end
  #cvcは3か4文字でしか登録できない
  it "is valid with cvc's number of characters 3" do
    card = build(:card)
    expect(card).to be_valid
  end

  it "is valid with cvc's number of characters 4" do
    card = build(:card, cvc: "2345")
    expect(card).to be_valid
  end

  it "is invalid with cvc's number of characters 6" do
    card = build(:card, cvc: "123456")
    expect(card.errors[:cvc]).to include()
  end
  #有効期限月は１〜１２しか登録できない
  it "is valid with month is 1~12" do
    card = build(:card)
    expect(card).to be_valid
  end

  it "is ininvalid with cvc's number of characters 13" do
    card = build(:card, month: "13")
    expect(card.errors[:month]).to include()
  end
  #有効期限年は登録している年から10年以内でないと登録できない
  it "is valid with year is now to 10" do
    card = build(:card)
    expect(card).to be_valid
  end

  it "is invalid with year is not now to 10" do
    card = build(:card, year: "16")
    expect(card.errors[:year]).to include()
  end
  #user_idがないと登録できない
  it "is valid with user_id" do
    card = build(:card)
    expect(card).to be_valid
  end

  it "is invalid with user_id" do
    card = build(:card, user_id: "")
    expect(card.errors[:user_id]).to include()
  end
end
