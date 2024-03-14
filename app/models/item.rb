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

  validates :image, :item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id,
            presence: true
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
