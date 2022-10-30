puts "🌱 Seeding spices..."

List.create({
    name: "ToDo"
})

List.create({
    name: "Shopping"
})

List.create({
    name: "Baby Shopping List"
})

Task.create({
    name: "Do dishes",
    completed: false,
    list_id: 1
})

Task.create({
    name: "mow lawn",
    completed: false,
    list_id: 1
})

Task.create({
    name: "take out garbage",
    completed: false,
    list_id: 1
})

Task.create({
    name: "bananas",
    completed: false,
    list_id: 2
})

Task.create({
    name: "apples",
    completed: false,
    list_id: 2
})

Task.create({
    name: "cereal",
    completed: false,
    list_id: 2
})

Task.create({
    name: "binkies",
    completed: false,
    list_id: 3
})

Task.create({
    name: "crib",
    completed: false,
    list_id: 3
})

Task.create({
    name: "bottles",
    completed: false,
    list_id: 3
})

puts "✅ Done seeding!"
