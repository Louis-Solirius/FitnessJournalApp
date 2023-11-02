require 'rails_helper'

RSpec.describe "body_weights/show", type: :view do
  before(:each) do
    assign(:body_weight, BodyWeight.create!(
      weight: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
