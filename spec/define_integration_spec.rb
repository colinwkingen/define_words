require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word define routing', {:type => :feature}) do
  it('accept a new word entry') do
    visit('/')
    fill_in('new_word', :with => 'Potato')
    click_button('Add Word')
    expect(page).to have_content('Potato')
  end
end
