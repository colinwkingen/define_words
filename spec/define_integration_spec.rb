require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word define routing', {:type => :feature}) do
  before() do
    Word.clear()
  end
  it('accepts a new word entry') do
    visit('/')
    fill_in('new_word', :with => 'Potato')
    click_button('Add Word')
    expect(page).to have_content('Potato')
  end
end
describe('add definition routing', {:type => :feature}) do
  before() do
    Word.clear()
  end
  it('allows you to visit a page to add definitions') do
    visit('/')
    fill_in('new_word', :with => 'Potato')
    click_button('Add Word')
    click_button('View Potato Definitions')
    expect(page).to have_content('Potato')
  end
end
describe('add definition routing', {:type => :feature}) do
  before() do
    Word.clear()
  end
  it('allows you to add definitions') do
    visit('/')
    fill_in('new_word', :with => 'Potato')
    click_button('Add Word')
    click_button('View Potato Definitions')
    fill_in('new_definition', :with => 'Starchy dirt fruit.')
    click_button('Add definition')
    expect(page).to have_content('Starchy dirt fruit.')
  end
end
