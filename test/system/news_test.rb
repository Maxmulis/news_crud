require "application_system_test_case"

class NewsTest < ApplicationSystemTestCase

  setup do
    @project = projects(:testprojekt)
    @news = news(:first)
  end

  test 'Creating a valid newsentry' do
    visit projects_path

    assert_selector 'h1', text: 'All Projects'
    click_on 'Testprojekt'
    click_on 'Create new news entry'

    fill_in 'Title', with: 'New news'
    fill_in 'Description', with: 'New Description'

    select 'aschmidt', from: 'Author'
    click_on 'Create News'

    assert_text 'New news'
  end
  # test "visiting the index" do
  #   visit news_url
  #
  #   assert_selector "h1", text: "News"
  # end
end
