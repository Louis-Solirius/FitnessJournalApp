require 'rails_helper'

RSpec.describe "body_weights/edit", type: :view do
  let(:body_weight) {
    BodyWeight.create!(
      weight: 1
    )
  }

  before(:each) do
    assign(:body_weight, body_weight)
  end

  it "renders the edit body_weight form" do
    render

    assert_select "form[action=?][method=?]", body_weight_path(body_weight), "post" do

      assert_select "input[name=?]", "body_weight[weight]"
    end
  end
end
