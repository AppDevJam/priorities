class PagesController < ApplicationController
  skip_before_action(:force_user_sign_in)
  def hello
    render({ :template => "pages/welcome.html.erb" })
  end  
end