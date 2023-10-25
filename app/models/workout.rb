class Workout < ApplicationRecord

    belongs_to :user

    validates :date, presence: true
    validates :notes, presence: true
    validates :title, presence: true
end
