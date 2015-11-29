require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name1",
        :url => "Url",
        :description => "MyText"
      ),
      Company.create!(
        :name => "Name1",
        :url => "Url2",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
