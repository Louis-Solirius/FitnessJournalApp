require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  setup do
    @workout = workouts(:one) # Assuming you have workout fixtures.
    @exercise = Exercise.new(name: "Push Up", reps: 10, sets: 3, weight: 0, rpe: 7, workout: @workout)
  end

  test 'is valid with valid attributes' do
    assert @exercise.valid?
  end

  test 'is invalid without a name' do
    @exercise.name = nil
    refute @exercise.valid?, 'exercise is valid without a name'
    assert_not_nil @exercise.errors[:name], 'no validation error for name present'
  end

  test 'is invalid with non-integer reps' do
    @exercise.reps = "a lot"
    refute @exercise.valid?
    assert_not_nil @exercise.errors[:reps]
  end

  test 'is invalid with negative sets' do
    @exercise.sets = -1
    refute @exercise.valid?
    assert_not_nil @exercise.errors[:sets]
  end

  test 'is invalid with negative weight' do
    @exercise.weight = -1
    refute @exercise.valid?
    assert_not_nil @exercise.errors[:weight]
  end

  test 'is invalid with rpe greater than 10' do
    @exercise.rpe = 11
    refute @exercise.valid?
    assert_not_nil @exercise.errors[:rpe]
  end

  test 'total weight lifted calculates correctly' do
    expected_total = @exercise.reps * @exercise.sets * @exercise.weight
    assert_equal expected_total, @exercise.total_weight_lifted, 'total weight lifted did not calculate correctly'
  end
end
