require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a default name Untitled Project" do
    p = described_class.create
    expect(p.name).to eq "Untitled Project"
  end
end
