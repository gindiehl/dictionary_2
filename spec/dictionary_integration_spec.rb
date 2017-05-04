require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adding a new word", {:type => :feature}) do
  it("allows user to click a word to see definitions for it") do
    visit("/")
    click_link('Add a new word')
    fill_in("new_word", :with => "arch")
    click_button('Add Word')
    expect(page).to have_content("arch")
  end
end

describe('viewing a list of all of the words', {:type => :feature}) do
  it('allows a user to see all of the words that have been created') do
    word = Word.new({:new_word => "arch", :id => 1, :term => "definition"})
    word.save
    visit('/')
    click_link("See my list of words")
    expect(page).to have_content(word.new_word)
  end
end

describe('seeing definitions for a single word', {:type => :feature}) do
  it('allows a user to click a word to see the definitions for it') do
    test_word = Word.new({:new_word => "cat", :id => 1, :term => "definition"})
    test_word.save()
    test_definition = Definition.new({:define_word => "a feline mammal", :id => 1})
    test_definition.save()
    visit('/words')
  end
end

describe('adding definitions to a word', {:type => :feature}) do
  it('allows a user to add a definition to a word') do
    test_word = Word.new({:new_word => "cat", :id => 1 })
    test_word.save()
    visit("/words/:id/definitions/new")
    fill_in('define_word', :with => "a feline mammal")
    click_button("Add Definition")
    expect(page).to have_content("Here are your definitions for this word:")
  end
end
