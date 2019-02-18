require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test 'printing empty weight' do
    visit pages_url
    assert_match "Главная страница", find("h3", :text => /\AГлавная страница\z/).text
    fill_in "user_id", with: '4d14187a-dc04-4797-a084-94fedfc0f709'
    click_button 'Поиск'
    assert_match "Вес пользователя:", find("h3", :text => /\AВес пользователя:\z/).text
    assert_match "данные отсутствуют", find("p", :text => /\Aданные отсутствуют\z/).text
  end

  test 'printing weight' do
    visit pages_url
    fill_in "user_id", with: '9c9b918d-cab9-41b6-af38-824614e322f8'
    click_button 'Поиск'
    assert_match "55.0 kg", find("p", :text => /\A55.0 kg\z/).text
  end

end
