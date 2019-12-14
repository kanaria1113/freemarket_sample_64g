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
end
