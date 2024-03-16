class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :user
  has_one    :order

  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :user_id
    validates :image
    validates :item_name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :condition_id
    validates :postage_id
    validates :delivery_day_id
  end
end
