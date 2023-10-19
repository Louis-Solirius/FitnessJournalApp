class Workout < ApplicationRecord
    validates :date, presence: true
    validates :notes, presence: true
    validates :title, presence: true
end
