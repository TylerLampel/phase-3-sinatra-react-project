puts "🌱 Seeding spices..."

User.create({
    username: "Tyler"
})

Item.create({
    task: "Do dishes"
    completed: false
})

puts "✅ Done seeding!"
