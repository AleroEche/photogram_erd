class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :receipient,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
