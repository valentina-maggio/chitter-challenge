feature 'viewing peeps' do
  feature 'visiting the home page' do
    scenario ' the page title is visible' do
      visit '/peeps'

      expect(page).to have_content 'Here are the latest peeps!'
    end
  end

  feature 'viewing peeps' do
    scenario 'a user can see peeps' do
      Peep.post(peep: 'What a beautil day!', user_id: 3)
      Peep.post(peep: 'Going for a run now', user_id: 5)

      visit '/peeps'

      expect(page).to have_content 'What a beautil day!'
      expect(page).to have_content 'Going for a run now'
    end
  end
end
