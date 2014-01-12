require 'spec_helper'

describe CommitteesController do
  before {
    create(:committee, name: "Meals on Wheels", description: "Preparing meals to be delivered to seniors who are homebound.", location: "Dining Hall Kitchen")
  }

  it "disallows guest access to #show" do
    get :show, :id => 1
    expect(response).to redirect_to(root_path)
  end

end
