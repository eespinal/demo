require 'spec_helper'
include Demo

describe 'Main' do

  let(:sut) { Main.new }
  let(:constants) { Demo::Constants }

  context 'Visit wired.com ->' do

    before :all do
      sut.go_to_homepage
    end

    after :all do
      sut.close_browser
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

    context 'Hover over another primary nav tab' do

      before :all do
        sut.hover_over_video_tab
      end

      it "should display content for the video tab section" do
        sut.video_tab_content.should be_present
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

    context 'Go to search' do

      before :all do
        sut.go_to_search_page
      end

      it "should load the search page" do
        sut.search_results_div.should be_present
      end

    end

    context 'Search for hello' do

      before :all do
        sut.search_for('hello')
      end

      it "should return results for the query" do
        sut.search_results_list.should be_present
      end

    end

    context 'Return to homepage' do

      before :all do
        sut.click_on_wired_logo
      end

      it "should go to the homepage" do
        sut.current_url.should == 'http://www.wired.com/'
      end

    end

    context 'Go to first headline' do

      before :all do
        sut.go_to_first_headline
      end

      it "should go to that headline page" do
        sut.first_headline_visited?.should be_true
      end

    end

    context 'Return to homepage' do

      before :all do
        sut.click_on_wired_logo
      end

      it "should go to the homepage" do
        sut.current_url.should == 'http://www.wired.com/'
      end

    end

    context 'Navigate to Contact Us' do

      before :all do
        sut.scroll_down(1900)
        sut.click_on_contact_us
      end

      it "should load the contact us page" do
        sut.current_url.should == 'http://www.wired.com/about/feedback/'
      end

    end

    context 'Navigate to Login/Register' do

      before :all do
        sut.click_on_wired_logo
        sut.scroll_down(1900)
        sut.click_on_login_register
      end

      it "should load the login/register page" do
        sut.current_url.should == 'https://secure.wired.com/user/login'
      end

    end

    context 'Navigate to Newsletter' do

      before :all do
        sut.click_on_wired_logo
        sut.scroll_down(1900)
        sut.click_on_newsletter
      end

      it "should load the newsletter page" do
        sut.current_url.should == 'http://www.wired.com/services/newsletters'
      end

    end

  end

end
