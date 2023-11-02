class Workout < ApplicationRecord

    belongs_to :user

    has_many :exercises, dependent: :destroy, inverse_of: :workout
    accepts_nested_attributes_for :exercises, allow_destroy: true, reject_if: :all_blank

    has_one_attached :image

    validates :date, presence: true
    validates :notes, presence: true
    validates :title, presence: true

    def image_as_thumbnail
        image.variant(resize_to_limit: [1000, 1000]).processed
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "date", "id", "id_value", "notes", "title", "updated_at", "user_id"]
      end
end
