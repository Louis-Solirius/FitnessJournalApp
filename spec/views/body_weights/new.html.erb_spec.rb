require 'rails_helper'

RSpec.describe "body_weights/new", type: :view do
  before(:each) do
    assign(:body_weight, BodyWeight.new(
      weight: 1
    ))
  end

  it "renders new body_weight form" do
    render

    assert_select "form[action=?][method=?]", body_weights_path, "post" do

      assert_select "input[name=?]", "body_weight[weight]"
    end
  end
end
