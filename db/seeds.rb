# Reset the database
User.destroy_all
Order.destroy_all
Product.destroy_all
OrderProduct.destroy_all

#----------------------------------------------------

# user's seed file
user01 = User.create(:username => 'HappyUser1', :email => 'user1@user.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')

user02 = User.create(:username => 'HappyUser2', :email => 'user2@user.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')

user03 = User.create(:username => 'HappyUser3', :email => 'user3@user.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')

admin01 = User.create(:username => 'HappyAdmin01', :email => 'admin@admin.com', :password => 'abcd1234', :password_confirmation => 'abcd1234', :admin => true)

#----------------------------------------------------

# order's seed file
order01 = user01.orders.create
order02 = user01.orders.create
order03 = user01.orders.create

order04 = user02.orders.create
order05 = user02.orders.create
order06 = user02.orders.create

order07 = user03.orders.create
order08 = user03.orders.create
order09 = user03.orders.create

order10 = admin01.orders.create
order11 = admin01.orders.create
order12 = admin01.orders.create

#----------------------------------------------------

# product's seed file
product01 = Product.create(:title => 'Item01', :price => 10.50, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product02 = Product.create(:title => 'Item02', :price => 10.90, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 8)

product03 = Product.create(:title => 'Item03', :price => 20.20, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 88)

product04 = Product.create(:title => 'Item04', :price => 9.80, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 14)

product05 = Product.create(:title => 'Item05', :price => 10.50, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 15)

product06 = Product.create(:title => 'Item06', :price => 10.90, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product07 = Product.create(:title => 'Item07', :price => 20.20, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product08 = Product.create(:title => 'Item08', :price => 9.80, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 19)

product09 = Product.create(:title => 'Item09', :price => 20.20, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product10 = Product.create(:title => 'Item10', :price => 9.80, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product11 = Product.create(:title => 'Item11', :price => 10.50, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product12 = Product.create(:title => 'Item12', :price => 10.90, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product13 = Product.create(:title => 'Item13', :price => 20.20, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product14 = Product.create(:title => 'Item14', :price => 9.80, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product15 = Product.create(:title => 'Item15', :price => 10.50, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product16 = Product.create(:title => 'Item16', :price => 10.90, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 17)

product17 = Product.create(:title => 'Item17', :price => 20.20, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 10)

product18 = Product.create(:title => 'Item18', :price => 9.80, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 55)

product19 = Product.create(:title => 'Item19', :price => 20.20, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 140)

product20 = Product.create(:title => 'Item20', :price => 9.80, :description => 'product Lorem ipsum, lorem lorem ipsum', :image_url => 'testingimg.jpeg', :stock => 120)

#----------------------------------------------------

# order_product's seed file
orderProduct01 = order01.order_products.create(:product_id => product01.id, :quantity => 10)
orderProduct02 = order01.order_products.create(:product_id => product01.id, :quantity => 10)
orderProduct03 = order01.order_products.create(:product_id => product01.id, :quantity => 10)


