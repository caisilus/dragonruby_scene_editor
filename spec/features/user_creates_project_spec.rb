require "rails_helper"

RSpec.describe "User creates project", type: :feature do
  it "they see the page for the submitted project" do
    project_name = "My first project"

    visit root_path
    click_on "Create new project"
    fill_in "project_name", with: project_name
    click_on "Create"

    expect(page).to have_text project_name
  end
end
