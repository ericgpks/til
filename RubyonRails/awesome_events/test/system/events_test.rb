require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  test "/event/:idページを表示" do
    event = FactoryBot.create(:event)
    visit event_url(event)
    assert_selector "h1", text: event.name
  end
  
  test "/events/newページを表示" do
    sign_in_as(FactoryBot.create(:user))
    
    visit new_event_url
    assert_selector "h1", text: "イベント作成"
  end
end
