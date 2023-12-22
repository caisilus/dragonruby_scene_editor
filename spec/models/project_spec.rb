require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "abbreviation method" do
    it "returns capitalized first letter if there is only one word in project name" do
      expect(true).to be(false)
    end
  end

  it "has default value true for create_scene_manage" do
    p = described_class.new(name: "Project 1")
    expect(p.create_scene_manager).to be true
  end

  it "has a default name Untitled Project" do
    p = described_class.create
    expect(p.name).to eq "Untitled Project"
  end
end
