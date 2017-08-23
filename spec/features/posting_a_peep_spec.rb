require 'launchy'

feature "peep page" do

  before do
    # Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end
  scenario "User posts a peep" do
    visit "/peeps"
    click_button("Add peep")
    fill_in :message, with: "Hey everyone"
    click_button "Submit"
    expect(page).to have_content("Hey everyone")
  end

  scenario "User adds 3 peeps and sees them in reverse chronological order" do
    visit "/peeps"
    click_button("Add peep")
    fill_in :message, with: "First"
    click_button "Submit"
    click_button("Add peep")
    fill_in :message, with: "Second"
    click_button "Submit"
    click_button("Add peep")
    fill_in :message, with: "Third"
    click_button "Submit"
    save_and_open_page
    expect(page).to have_content("Third\nSecond\nFirst")
  end
end