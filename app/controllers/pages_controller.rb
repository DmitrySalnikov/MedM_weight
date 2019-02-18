class PagesController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  def index
  end

  def create
    @user_id = params.require(:main_form).permit(:user_id)[:user_id].strip

    # Проверка существования ID
    existing_users = Nokogiri::XML(open('https://temp.medm-test.com/api/v3/' +
      'provider/users?auth_token=' + token())).xpath("//ident-record-id")
    flag = false
    for x in existing_users
      if (x.content == @user_id)
        flag = true
        break
      end
    end
    if (!flag)
      @wrong_id = "Несуществующий ID"
      render :index
    end
  end

  def print_weight
    # получение значения веса
    user_id = params.permit(:user_id)[:user_id]
    url = 'https://temp.medm-test.com/api/v3/provider/records/' +
      user_id + '/measurements/weights?sort_by=updated_at&order=desc&' +
      'count=1&auth_token=' + token();
    xml = Nokogiri::XML(open(url));
    if (!xml.at_xpath("//value"))
      render json: {response: "данные отсутствуют"}
    else
      render json: {response: xml.at_xpath("//value").content +
        ' ' + xml.at_xpath("//units").content}
    end
  end

  private def token
    "09321865-5587-4ae5-b1ed-c5b31d107424"
  end

end
