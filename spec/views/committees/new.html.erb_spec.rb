# frozen_string_literal: true

require "rails_helper"

RSpec.describe "committees/new", type: :view do
  before(:each) do
    assign(:committee, Committee.new(
                         name: "MyString",
                         code: "MyString",
                         website: "MyString"
    ))
  end

  it "renders new committee form" do
    render

    assert_select "form[action=?][method=?]", committees_path, "post" do

      assert_select "input[name=?]", "committee[name]"

      assert_select "input[name=?]", "committee[code]"

      assert_select "input[name=?]", "committee[website]"
    end
  end
end
