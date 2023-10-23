# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@john = User.create!(name: 'John',
                     email: "john.doe@mail.com",
                     password: "admin1234",
                     password_confirmation: "admin1234",
                     confirmed_at: Time.now)
Recipe.create(author: @john,
              name: 'Perfect Chicken',
              description: 'Chicken stock, wine, onions, garlic, mushroom, cream, butter, herbs, lemon, and capers
reduce to make a perfect sauce. Served alongside mushroom rice and asparagus; it is HEAVEN! Patience is key with the
sauce. The flavors will come together beautifully if you allow them to reduce as directed.',
              preparation_time: 10,
              cooking_time: 75)
Recipe.create(author: @john,
              name: 'Johnny Marzetti Casserole',
              description: 'Kids love this buffet-ready Johnny Marzetti casserole. My mother-in-law used to make a
simpler version of this for my husband when he was growing up. This version pushes the flavor profile a bit. Sometimes
I let the casserole sit overnight before baking, as the flavors improve and the pasta absorbs some of the sauce,
so the consistency is just right.',
              preparation_time: 30,
              cooking_time: 65)