class PagesController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  def index
  end

  def create
    @user_id = params.require(:main_form).permit(:user_id)[:user_id]
    if (false)
      @error = "error"
      render :index
    end
  end

  def print_weight
    user_id = params.permit(:user_id)[:user_id]
    url = 'https://temp.medm-test.com/api/v3/' +
      'provider/records/'+user_id+'/measurements/'+
      'weights?sort_by=updated_at&order=desc&'+
      'count=1&auth_token=09321865-5587-4ae5-b1ed-c5b31d107424'
    xml = Nokogiri::XML(open(url));
    render json: {response: xml.at_xpath("//value").content.to_s +
      ' ' + xml.at_xpath("//units").content.to_s}
  end

end
