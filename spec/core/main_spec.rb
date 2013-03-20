require 'spec_helper'
include Demo

describe 'Main' do

  let(:sut) { Main.new }
  let(:constants) { Demo::Constants }

  context 'Visit wired.com ->' do

    before :all do
      sut.go_to_homepage
    end

    it "should show a headline" do
      sut.headline.should be_present
    end

    it "should have the recent stories section selected" do
      sut.active_content_tab.should == 'RECENT STORIES'
    end

    context 'Scroll down page' do

      before :all do
        sut.scroll_down(400)
      end

      it "should display the subscription pop up" do
        sut.subscription_pop_up.should be_present
      end

    end

    context 'Hover over primary nav tabs' do

      before :all do
        sut.hover_over_gear_tab
      end

      it "should display content for that tab section" do
        sut.gear_tab_content.should be_present
      end

    end

    context 'Hover over another primary nav tab' do

      before :all do
        sut.hover_over_science_tab
      end

      it "should display content for that tab section" do
        sut.science_tab_content.should be_present
      end

    end

    context 'Hover over subscribe primary nav tab' do

      before :all do
        sut.hover_over_subscribe_tab
      end

      it "should display content for the subscribe tab section" do
        sut.subscribe_tab_content.should be_present
      end

    end

    context 'Go to all headlines tab section' do

      before :all do
        sut.scroll_down(1500)
        sut.click_on_all_headlines_tab
      end

      it "should switch to the latest posts tab content in the tab section" do
        sut.latest_blog_posts.should be_present
      end

    end

    context 'Go to hottest web links tab section' do

      before :all do
        sut.click_on_hottest_web_links
      end

      it "should switch to the hottest web link tab content in the tab section" do
        sut.hottest_web_link_entries.should be_present
      end

    end

    context 'Click right subscribe button' do

      before :all do
        sut.click_right_subscribe
      end

      after :all do
        sut.close_subscription_window
      end

      it "should open a new window" do
        sut.new_window_opened?.should be_true
      end

      it "should have the subscribe wired page" do
        sut.new_window_url.should include('subscribe.wired.com')
      end

    end

  end

end
