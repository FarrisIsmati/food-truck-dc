Comment.destroy_all
Truck.destroy_all
Company.destroy_all
User.destroy_all

user1 = User.create({
  email: "user1@gmail.com",
  password: "password",
  admin: false
})

company1 = Company.create({
  name: "Pepe",
  website: "http://www.joseandrescatering.com/index.php/pepe/",
  credit_card: true,
  profile_img: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwi2s7Lls8bXAhVn64MKHR-vAk8QjRwIBw&url=https%3A%2F%2Fdc.eater.com%2Fvenue%2F735%2Fpepe&psig=AOvVaw1gxfibWqJaTHYwuHo4bJ5B&ust=1511035433240251",
  phone_number: "(202) 638-0202",
  bio: "This is the BIO"
}.merge(user: user1))

truck1 = Truck.create({
  name: "Pepe1"
}.merge(company: company1))

comment1 = Comment.create({
  name: "John Stamos",
  body: "Jose Andre is an A okay chef!"
}.merge(company: company1))

comment2 = Comment.create({
  name: "Cherry Garcia",
  body: "Get the Jamon"
}.merge(company: company1))
