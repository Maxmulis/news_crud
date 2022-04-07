require "application_system_test_case"

class NewsTest < ApplicationSystemTestCase

  setup do
    @project = projects(:testprojekt)
    @news = news(:first)
  end

  test 'Creating a valid newsentry' do
    visit projects_url

    assert_selector 'h1', text: 'All Projects'
    click_on 'Testprojekt'
    click_on 'Create new newsentry'

    assert_selector 'h1', text:'New newsentry'
    fill_in 'Title', with: 'New news'
    fill_in 'Description', with: 'New Description'

    select 'aschmidt', from: 'Author'
    select 'Testprojekt', from: 'Project'
    click_on 'Create newsentry'

    assert_text 'New news'
  end
  # test "visiting the index" do
  #   visit news_url
  #
  #   assert_selector "h1", text: "News"
  # end
end
