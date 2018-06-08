require 'rails_helper'

RSpec.describe "committees/edit", type: :view do
  before(:each) do
    @committee = assign(:committee, Committee.create!(
      :name => "MyString",
      :code => "MyString",
      :website => "MyString"
    ))
  end

  it "renders the edit committee form" do
    render

    assert_select "form[action=?][method=?]", committee_path(@committee), "post" do

      assert_select "input[name=?]", "committee[name]"

      assert_select "input[name=?]", "committee[code]"

      assert_select "input[name=?]", "committee[website]"
    end
  end
end
