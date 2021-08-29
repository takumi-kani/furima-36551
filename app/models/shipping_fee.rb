class ShippingFee < ActiveHash::Base
  self.data = [
    {name: '着払い(購入者負担)'}, {name: '送料込み(出品者負担)'}
  ]
end