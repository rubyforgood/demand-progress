require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #index" do
    it "returns a list of events from the beginning of this week forward" do
      old_event = create :event, :last_week
      events = create_list :event, 3, :next_week

      get :index

      expect(@controller.view_context.send(:events)).to include *events
      expect(@controller.view_context.send(:events)).to_not include old_event
    end
  end

end
