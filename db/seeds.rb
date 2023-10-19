10.times do
    Author.create(
        name: Faker::Name.name_with_middle
    )
end