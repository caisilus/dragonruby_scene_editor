require "rails_helper"

RSpec.describe "projects/index", type: :view do
  before do
    assign(:projects, [
             Project.create!(
               name: "Name"
             ),
             Project.create!(
               name: "Name"
             )
           ])
  end

  it "renders a list of projects" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
