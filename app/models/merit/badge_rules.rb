# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+:votes => 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'tracked-5', :to => :user do |track|
        track.user.trackers.count == 5
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'tracked-10', :to => :user do |track|
        track.user.trackers.count == 10
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'tracked-25', :to => :user do |track|
        track.user.trackers.count == 25
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'tracked-50', :to => :user do |track|
        track.user.trackers.count == 50
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'tracked-100', :to => :user do |track|
        track.user.trackers.count == 100
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'tracked-500', :to => :user do |track|
        track.user.trackers.count == 500
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'citizen', :temporary => true, :to => :user do |user|
        user.user.has_membership == true
      end

      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'vipmember', :temporary => true, :to => :user do |user|
        user.user.membership_number.blank? == false
      end

      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'five-drink-5', :to => :user do |track|
        track.user.trackers.where(created_at: (Time.zone.now.midnight - 1.day)..(Time.zone.now.midnight + 1.day)).count == 5
      end
            
      grant_on ['trackers#track', 'trackers#point_track'], :badge => 'five-drink-10', :to => :user do |track|
        track.user.trackers.where(created_at: (Time.zone.now.midnight - 1.day)..(Time.zone.now.midnight + 1.day)).count == 10
      end
            
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # grant_on 'users#create', :badge => 'just-registered', :to => :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', :badge => 'commenter', :level => 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', :badge => 'relevant-commenter', :to => :user do |comment|
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'user#update', :badge => 'autobiographer', :temporary => true, :model_name => 'User' do |user|
      #   user.name.length > 4
      # end
    end
  end
end
