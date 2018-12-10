class Like < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :photo

  # Indirect associations

  # Validations

end
