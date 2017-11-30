Comment.destroy_all
Truck.destroy_all
Company.destroy_all
User.destroy_all

user1 = User.create({
  email: "user1@gmail.com",
  password: "password",
  admin: false
})

user2 = User.create({
  email: "user2@gmail.com",
  password: "password",
  admin: false
})

company1 = Company.create({
  name: "Pepe",
  website: "http://www.joseandrescatering.com/index.php/pepe/",
  credit_card: true,
  profile_img: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwi2s7Lls8bXAhVn64MKHR-vAk8QjRwIBw&url=https%3A%2F%2Fdc.eater.com%2Fvenue%2F735%2Fpepe&psig=AOvVaw1gxfibWqJaTHYwuHo4bJ5B&ust=1511035433240251",
  phone_number: "(202) 638-0202",
  bio: "José Andrés Catering is proud to offer Pepe, the food truck that brings you the famous Spanish flauta sandwiches from José’s native Spain.

With fresh-baked bread, long and thin like a flute, each sandwich is made fresh on the spot, and includes such flavorful selections as the butifarra “burger” (fresh pork, roasted peppers and alioli), pollo frito (fried chicken), escalivada (Spanish-style roasted vegetables), jamon Serrano y queso Manchego (the classic Spanish ham and cheese) and many more."
}.merge(user: user1))

company2 = Company.create({
  name: "Peruvian Brothers",
  website: "https://www.peruvianbrothers.com/",
  credit_card: true,
  profile_img: "https://s3-media3.fl.yelpcdn.com/bphoto/udFD2GpcA7d4LVm2aHFV6w/90s.jpg",
  phone_number: "(202) 233-2221",
  bio: "At the core, Peruvian Brothers is about passion.  We are passionate about the food we grew up eating and where we are from.  When developing Peruvian Brothers, we wanted to give Washington D.C. not only delicious Peruvian food, but also a piece of our heritage. As a two time Olympic athlete in competitive rowing, I try to show the same dedication on the business side to match my brother Mario’s skills in the kitchen. We were born and raised off the coast of Lima, Peru, in a close-knit community of “La Punta” where family and the ocean reigned. Mario & I were separated for almost thirteen years working on two very different life paths but this was always the dream.  Chimpun, Callao!"
}.merge(user: user2))

company3 = Company.create({
  name: "Tasty Kabob",
  website: "http://tastykabobinc.com/",
  credit_card: true,
  profile_img: "https://s3-media3.fl.yelpcdn.com/bphoto/udFD2GpcA7d4LVm2aHFV6w/90s.jpg",
  phone_number: "(202) 133-2521",
  bio: "Tasty Kabob Inc, hit the road back in the fall of 2010 when founder's John & Steve Hanifi envisioned bringing their favorite meals from their home country of Afghanistan to the people of Washington, DC. Since then, the father and son team has expanded to a fleet of 5 Clean Green Tasty Machines.

Location's served by Tasty Kabob in both DC & Virginia include the following: McPherson Square, the CNN Building, 9th & E St NW, Cap South, GWU, Tyson's Corner, 20th & L St NW, State Department, ICE Building, and many more. Be sure to follow us on twitter for our schedule, which is published daily."
}.merge(user: user2))

company4 = Company.create({
  name: "Rollin Pizza DC",
  website: "https://roaminghunger.com/rollin-pizza-dc/",
  credit_card: false,
  profile_img: "https://s3-media3.fl.yelpcdn.com/bphoto/udFD2GpcA7d4LVm2aHFV6w/90s.jpg",
  phone_number: "(202) 33-2221",
  bio: "Looking for fast, fresh, delicious pizza on the streets of DC? Then Rollin Pizza DC is just right for you! Made to order from the finest ingredients around, every bite of your spectacular pie was made with you in mind. Don't miss out on the best taste you'll find on the streets of DC, grab yourself some Rollin Pizza today!"
}.merge(user: user2))

comment1 = Comment.create({
  name: "Perry Fustero",
  body: "Highly recommended! Most authentic spanish food truck around."
}.merge(company: company1))

comment2 = Comment.create({
  name: "Zachary Fleischmann",
  body: "I've had better Prosciutto"
}.merge(company: company1))

comment3 = Comment.create({
  name: "Andrew Whitley",
  body: "Best chicken I've ever had. Roll Tide"
}.merge(company: company4))
