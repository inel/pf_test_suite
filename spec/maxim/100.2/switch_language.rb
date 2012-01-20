# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "language", :js =>true do

  before (:each) do
    reset_session!
    visit ""
  end

  it "MSIS100.2.1-1-1 Switch English to another language" do
    find(:css, '#ext-gen39').click
    sleep(3)
    find('div[class="x-combo-list-item"]',:text=>"Русский (Russian)").click
    wait_until(50) do
      has_selector?('span',:text=>"Пожалуйста войдите")
    end
  end

  it "MSIS100.2.1-1-2 Switch language back to English" do
    find(:css, '#ext-gen39').click
    sleep(3)
    find('div[class="x-combo-list-item"]',:text=>"Русский (Russian)").click
    wait_until(50) do
      has_selector?('span',:text=>"Пожалуйста войдите")
    end
    find(:css, '#ext-gen39').click
    sleep(3)
    find('div[class="x-combo-list-item"]',:text=>"English").click
    wait_until(50) do
      has_selector?('span',:text=>"Please Login")
    end
  end

  it "MSIS100.2.1-2-1 Check switching language from English to another one after logging in" do
    find(:css, '#ext-gen39').click
    sleep(3)
    find('div[class="x-combo-list-item"]',:text=>"Русский (Russian)").click
    fill_in("LoginForm[username]",:with=>"admin")
    fill_in("LoginForm[password]",:with=>"admin1")
    sleep(2)
    click_button("Войти")
    sleep(2)
    wait_until(50) do
      has_selector?('button',:text=>"Обратная связь")
    end
  end

  it "MSIS100.2.1-2-2 Check switching language back to English after logging in" do
    find(:css, '#ext-gen39').click
    sleep(3)
    find('div[class="x-combo-list-item"]',:text=>"Русский (Russian)").click
    fill_in("LoginForm[username]",:with=>"admin")
    fill_in("LoginForm[password]",:with=>"admin1")
    sleep(2)
    click_button("Войти")
    sleep(5)
    wait_until(50) do
      has_selector?('button',:text=>"Обратная связь")
    end    
    find('a',:text=>"Выйти").click
    sleep(2)    
    fill_in("LoginForm[username]",:with=>"admin")
    fill_in("LoginForm[password]",:with=>"admin1")
    sleep(2)
    click_button("Login")
    sleep(5)
    wait_until(70) do
      has_selector?('button', :text => "Feedback")
    end
  end
end