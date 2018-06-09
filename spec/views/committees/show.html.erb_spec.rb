# frozen_string_literal: true

require "rails_helper"

RSpec.describe "committees/show", type: :view do
  before(:each) do
    @committee = assign(:committee, Committee.create!(
                                      name: "Name",
                                      code: "Code",
                                      website: "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Website/)
  end
end
