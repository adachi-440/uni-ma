FactoryBot.define do
  factory :item do
    association :user
    name { 'テスト出品' }
    explanation { 'テスト説明文' }
    association :item_image
    association :item_category
    association :item_tag
    price { 1000 }
    association :lecture
    association :status
    place { '名古屋大学法学部棟' }
    association :sold
    view { 10 }
  end
end
