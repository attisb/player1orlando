# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongo_mapper and :mongoid
  # config.orm = :active_record

  # Define :user_model_name. This model will be used to grand badge if no :to option is given. Default is "User".
  # config.user_model_name = "User"

  # Define :current_user_method. Similar to previous option. It will be used to retrieve :user_model_name object if no :to option is given. Default is "current_#{user_model_name.downcase}".
  # config.current_user_method = "current_user"
end

# Create application badges (uses https://github.com/norman/ambry)
Merit::Badge.create!({
  id: 1,
  name: 'tracker-5',
  description: "Marked that you have tried 5 drinks.",
  image: '/includes/badges/tracked-5.png'
})

Merit::Badge.create!({
  id: 2,
  name: 'tracker-10',
  description: "Marked that you have tried 10 drinks.",
  image: '/includes/badges/tracked-10.png'
})

Merit::Badge.create!({
  id: 3,
  name: 'tracker-25',
  description: "Marked that you have tried 25 drinks.",
  image: '/includes/badges/tracked-25.png'
})

Merit::Badge.create!({
  id: 4,
  name: 'tracker-50',
  description: "Marked that you have tried 50 drinks.",
  image: '/includes/badges/tracked-50.png'
})

Merit::Badge.create!({
  id: 5,
  name: 'tracker-100',
  description: "Marked that you have tried 100 drinks.",
  image: '/includes/badges/tracked-100.png'
})

Merit::Badge.create!({
  id: 6,
  name: 'citizen',
  description: "That's right I'm a Player 1 Citizen!",
  image: '/includes/badges/citizen.png',
  custom_fields: { title: 'Player 1 Citizen' }
})

#   id: 2,
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# })
