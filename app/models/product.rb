# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  enum kind: {Food: 0, Drink: 1}

  validates :name_product, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: true
  validates :information, presence: true, length: { maximum: 255 }

  # def self.limit_product
  #   order(created_at: :desc).limit(4)
  # end

  # self.inheritance_column = :kind_of

  # def self.kind_ofs
  #   %w[Drink Food]
  # end
end