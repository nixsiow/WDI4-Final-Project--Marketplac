# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  price       :decimal(8, 2)
#  description :text
#  image_url   :string(255)
#  stock       :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  attr_accessible :title, :price, :description, :image_url, :stock

  validates :title, :presence => true
  validates :price, :presence => true
  validates :description, :presence => true
  validates :image_url, :presence => true
  validates :stock, :presence => true

  has_many :order_products
  has_many :orders, through: :order_products
end
