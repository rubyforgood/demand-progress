require 'rails_helper'

RSpec.describe "committees/index", type: :view do
  before(:each) do
    assign(:committees, [
      Committee.create!(
        :name => "Name",
        :code => "Code",
        :website => "Website"
      ),
      Committee.create!(
        :name => "Name",
        :code => "Code",
        :website => "Website"
      )
    ])
  end

  it "renders a list of committees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
