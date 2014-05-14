# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  attr_accessible :user_id

  validates :user_id, :presence => true

  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :user
end
