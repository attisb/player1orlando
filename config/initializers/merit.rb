# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongo_mapper and :mongoid
  config.orm = :active_record

  # Define :user_model_name. This model will be used to grand badge if no :to option is given. Default is "User".
  config.user_model_name = "User"

  # Define :current_user_method. Similar to previous option. It will be used to retrieve :user_model_name object if no :to option is given. Default is "current_#{user_model_name.downcase}".
  config.current_user_method = "current_user"
end

badges = [
  {
    id: 1,
    name: 'tracker-5',
    description: "Marked that you have tried 5 drinks.",
    image: '/includes/badges/tracked-5.png'
  },
  {
    id: 2,
    name: 'tracker-10',
    description: "Marked that you have tried 10 drinks.",
    image: '/includes/badges/tracked-10.png'
  },
  {
    id: 3,
    name: 'tracker-25',
    description: "Marked that you have tried 25 drinks.",
    image: '/includes/badges/tracked-25.png'
  },
  {
    id: 4,
    name: 'tracker-50',
    description: "Marked that you have tried 50 drinks.",
    image: '/includes/badges/tracked-50.png'
  },
  {
    id: 5,
    name: 'tracker-100',
    description: "Marked that you have tried 100 drinks.",
    image: '/includes/badges/tracked-100.png'
  },
  {
    id: 6,
    name: 'tracker-500',
    description: "Marked that you have tried 500 drinks.",
    image: '/includes/badges/tracked-500.png'
  },
  {
    id: 7,
    name: 'citizen',
    description: "That's right I'm a Player 1 Citizen!",
    image: '/includes/badges/citizen.png',
    custom_fields: { title: 'Player 1 Citizen' }
  },
  {
    id: 8,
    name: 'checkin-10',
    description: "Checked in to Player 1 10 times.",
    image: '/includes/badges/checkin-10.png',
    custom_fields: { title: 'Player 1 - 10 Visits' }
  },
  {
    id: 9,
    name: 'checkin-20',
    description: "Checked in to Player 1 20 times.",
    image: '/includes/badges/checkin-20.png',
    custom_fields: { title: 'Player 1 - 20 Visits' }
  },
  {
    id: 10,
    name: 'checkin-50',
    description: "Checked in to Player 1 50 times.",
    image: '/includes/badges/checkin-50.png',
    custom_fields: { title: 'Player 1 - 50 Visits' }
  },
  {
    id: 11,
    name: 'checkin-100',
    description: "Checked in to Player 1 100 times.",
    image: '/includes/badges/checkin-100.png',
    custom_fields: { title: 'Player 1 - 100 Visits' }
  },
  {
    id: 12,
    name: 'checkin-200',
    description: "Checked in to Player 1 200 times.",
    image: '/includes/badges/checkin-200.png',
    custom_fields: { title: 'Player 1 - 200 Visits' }
  },
  {
    id: 13,
    name: 'checkin-500',
    description: "Checked in to Player 1 500 times.",
    image: '/includes/badges/checkin-500.png',
    custom_fields: { title: 'Player 1 - 500 Visits' }
  },
  {
    id: 14,
    name: 'five-drink-5',
    description: "Had 5 awesome drinks at Player 1 in a day.",
    image: '/includes/badges/five-drink-5.png',
    custom_fields: { title: 'Five Drinks in a Day' }
  },
  {
    id: 15,
    name: 'ten-drink-10',
    description: "Had 10 awesome drinks at Player 1 in a day.",
    image: '/includes/badges/ten-drink-10.png',
    custom_fields: { title: 'Ten Drinks in a Day' }
  }
]

badges.each do |badge|
  Merit::Badge.create!(badge)
end


#   id: 2,
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# })
