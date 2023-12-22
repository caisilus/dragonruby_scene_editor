require "rails_helper"

RSpec.describe "projects/index", type: :view do
  before do
    assign(:projects, [
             Project.create!(
               name: "Project name"
             )
           ])
  end

  it "renders a list of projects" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("^Project name".to_s), count: 1
  end
end
