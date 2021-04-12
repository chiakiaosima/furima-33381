require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context  "出品ができる時" do
    it "全ての項目に入力があれば出品できる" do
      expect(@item).to be_valid
    end
  end

  context "出品ができない時" do
    it "商品画像がないと出品ができない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がないと出品ができない" do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "商品の説明がないと出品ができない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーを選択していないと登録ができない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態を選択していないと登録ができない" do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "配送料の負担を選択していないと登録ができない" do
      @item.subscriber_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Subscriber must be other than 1")
    end

    it "発送元の地域の選択をしていないと登録ができない" do
      @item.region_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end

    it "発送までの日数を選択をしていないと登録ができない" do
      @item.lead_time_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Lead time must be other than 1")
    end

    it "価格が設定されていないと登録ができない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が299円以下だと登録ができない" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it "価格が10,000,000以上だと登録ができない" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it "価格が大文字数字だと登録ができない" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it "価格が数字以外だと登録ができない" do
      @item.price = 'asuka'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end


  end


end
