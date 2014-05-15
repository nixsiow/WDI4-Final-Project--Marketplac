# == Schema Information
#
# Table name: order_products
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

class OrderProduct < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity

  # validates :order_id, :presence => true
  validates :product_id, :presence => true
  validates :quantity, :presence => true

  belongs_to :order
  belongs_to :product
end
