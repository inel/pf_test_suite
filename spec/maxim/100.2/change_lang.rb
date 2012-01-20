# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "language", :js =>true do

  before (:each) do
    reset_session!
    visit ""
  end

  it "MSIS100.2.1-1-1 Switch English to another language" do

    click_button("lang-btnEl")
    find('span',:text=>"Русский (Russian)").click
    wait_until(50) do
      has_selector?('span',:text=>"Идентификация")
    end
  end

  it "lang to en" do
    reset_session!
    visit "/login?locale=en"
    click_button("lang-btnEl")
    find('span',:text=>"Русский (Russian)").click
    wait_until(50) do
      has_selector?('span',:text=>"Идентификация")
    end
    click_button("lang-btnEl")
    find('span',:text=>"English (Английский)").click
    wait_until(50) do
      has_selector?('span',:text=>"Authentication")
    end
  end

end