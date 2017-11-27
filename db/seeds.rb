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
  bio: "you the famous Spanish flauta sandwiches from José’s native Spain.

With fresh-baked bread, long and thin like a flute, each sandwich is made fresh on the spot, and includes such flavorful selections as the butifarra “burger” (fresh pork, roasted peppers and alioli), pollo frito (fried chicken), escalivada (Spanish-style roasted vegetables), jamon Serrano y queso Manchego (the classic Spanish ham and cheese) and many more."
}.merge(user: user1))

truck1 = Truck.create({
  name: "Pepe1"
}.merge(company: company1))

comment1 = Comment.create({
  name: "Sloan Holzman",
  body: "I cant eat here because I'm a vegetarian. Aside from that the people were nice."
}.merge(company: company1))

comment2 = Comment.create({
  name: "Zachary",
  body: "Great food."
}.merge(company: company1))
