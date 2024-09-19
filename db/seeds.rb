require 'faker'

# Ensure the database is clean before seeding
puts "Cleaning database..."
User.destroy_all
Post.destroy_all
Address.destroy_all

# Create 100 users with 100 posts each and 1 address
puts "Creating users, posts, and addresses..."

100.times do |i|
  user = User.create!(
    name: Faker::Name.name
  )
  
  Address.create!(
    user: user,
    city: Faker::Address.city,
    state: Faker::Address.state
  )

  1000.times do
    Post.create!(
      user: user,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
    )
  end

  puts "Created user #{i+1} with 100 posts and 1 address" if (i+1) % 10 == 0
end

puts "Seeding completed!"
puts "Created #{User.count} users"
puts "Created #{Post.count} posts"
puts "Created #{Address.count} addresses"
