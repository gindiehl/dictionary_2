require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the dictionary path", {:type => :feature}) do

  it("allows user to enter and store words and definitions") do
    visit("/")
    click_on('Add a new word')
    fill_in("new_word", :with => "arch")
    click_button('Add Word')
    expect(page).to have_content("arch")
  end

  # fill_in("definition", :with => "a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.")
end
