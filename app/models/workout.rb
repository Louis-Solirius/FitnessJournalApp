class Workout < ApplicationRecord

    belongs_to :user

    has_many :exercises, dependent: :destroy, inverse_of: :workout
    accepts_nested_attributes_for :exercises, allow_destroy: true, reject_if: :all_blank

    validates :date, presence: true
    validates :notes, presence: true
    validates :title, presence: true
end
