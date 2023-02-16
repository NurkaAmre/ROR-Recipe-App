# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
    { name: 'Amre', email: 'amre@gmail.com', password: 'amre12' },
    { name: 'Olivier', email: 'olivier@gmail.com', password: 'olivier12'}
])

foods = Food.create([
    {user_id: 1, name: 'Garlic', measurement_unit: 'grams', price: 3, quantity: 15},
    {user_id: 2, name: 'Apple', measurement_unit: 'grams', price: 5, quantity: 20},
    {user_id: 1, name: 'Carrot', measurement_unit: 'grams', price: 4, quantity: 30},
    {user_id: 2, name: 'Meat', measurement_unit: 'kg', price: 14, quantity: 84},
    {user_id: 1, name: 'Milk', measurement_unit: 'ml', price: 2, quantity: 100},
    {user_id: 2, name: 'Sugar', measurement_unit: 'grams', price: 3, quantity: 50},
    {user_id: 1, name: 'Egg', measurement_unit: 'pieces', price: 1, quantity: 10},
    {user_id: 2, name: 'Bread', measurement_unit: 'pieces', price: 2, quantity: 20},
    {user_id: 1, name: 'Macaroni', measurement_unit: 'grams', price: 4, quantity: 50},
    {user_id: 2, name: 'Salt', measurement_unit: 'grams', price: 1, quantity: 100}
])

recipes = Recipe.create([
    {user_id: 1, name: 'Garlic bread', description: 'Garlic bread (also called garlic toast) consists of bread (usually a baguette, sour dough, or bread such as ciabatta), topped with garlic and olive oil or butter and may include additional herbs, such as oregano or chives', preparation_time: 10, cooking_time: 20, public: true},
    {user_id: 2, name: 'Apple Pie', description: 'An apple pie is a fruit pie in which the principal filling ingredient is apples. The earliest printed recipe is from England. Apple pie is often served with whipped cream, ice cream ("apple pie à la mode"), or cheddar cheese', preparation_time: 20, cooking_time: 30, public: true},
    {user_id: 1, name: 'Carrot Cake', description: 'Dish made by lining a shallow container with pastry and filling the container with a sweet or savoury mixture', preparation_time: 30, cooking_time: 40, public: false},
    {user_id: 2, name: 'Taco', description: 'A taco is a traditional Mexican food consisting of a small hand-sized corn- or wheat-based tortilla topped with a filling. ', preparation_time: 40, cooking_time: 50, public: true},
    {user_id: 1, name: 'Milk Shake', description: 'A milkshake (sometimes simply called a shake) is a sweet beverage made by blending milk, ice cream, and flavorings or sweeteners such as butterscotch, caramel sauce, chocolate syrup, fruit syrup, or whole fruit into a thick, sweet, cold mixture.', preparation_time: 50, cooking_time: 60, public: true},
    {user_id: 2, name: 'Fetuccini', description: 'Fettuccine pasta is a long, strand-like pasta that is often served al dente with a creamy, dairy-based sauce, such as the popular Fettuccine Alfredo. It works well with protein-based meals where chicken or another meat is a featured ingredient. ', preparation_time: 60, cooking_time: 70, public: false}
])
