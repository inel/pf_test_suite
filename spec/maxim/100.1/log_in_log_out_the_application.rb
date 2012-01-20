# -*- encoding : utf-8 -*-

require 'spec_helper'

describe "login", :js =>true do

  before (:each) do
      reset_session!
      visit ""
  end

  it "MSIS100.1.1-1-1 Log in the application" do
    fill_in("LoginForm[username]",:with=>"admin")
    fill_in("LoginForm[password]",:with=>"admin1")
    sleep(2)
    click_button("Login")
    sleep(2)
    wait_until(70) do
     has_selector?('span', :text => "Tree")
    end
   end

  it "MSIS100.1.1-1-2 Try to log in with invalid credentials" do
    fill_in("LoginForm[username]",:with=>"invalidlogin")
    fill_in("LoginForm[password]",:with=>"invalidpass")
    sleep(2)
    click_button("Login")
    wait_until(70) do
     has_selector?('span', :text => "Username is incorrect")
    end
  end

  it "MSIS100.1.1-2-1 Log out the application" do
    fill_in("LoginForm[username]",:with=>"admin")
    fill_in("LoginForm[password]",:with=>"admin1")
    sleep(2)
    click_button("Login")
    sleep(2)
    wait_until(70) do
     has_selector?('span', :text => "Tree")
    end
    sleep(2)
    find('a',:text=>"Logout").click
  end
end