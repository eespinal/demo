module Demo
  class Main

    attr_accessor :browser

    def initialize
      @browser = Watir::Browser.new :chrome
      #@browser = Watir::Browser.new :ff
    end

    def go_to_homepage
      browser.goto 'www.wired.com'
    end

    def scroll_down(pixels)
      browser.execute_script("window.scrollBy(0,#{pixels})")
    end

    def hover_over_gear_tab
      gear_tab.when_present.click
    end

    def hover_over_science_tab
      science_tab.when_present.click
    end

    def hover_over_subscribe_tab
      subscription_tab.when_present.hover
    end

    def click_on_all_headlines_tab
      pop_up = subscription_pop_up
      pop_up.div(:class => 'close').click if pop_up.present?
      secondary_tabs.a(:text => 'All Headlines').when_present.click
    end

    def click_on_hottest_web_links
      pop_up = subscription_pop_up
      pop_up.div(:class => 'close').click if pop_up.present?
      secondary_tabs.a(:text => 'Hottest Web Links').when_present.click
    end

    def click_right_subscribe
      browser.div(:id => 'subscription-rightNav').when_present.click
    end

    def close_subscription_window
      subscription_window.close
    end

    def headline
      browser.div(:id => 'primary_package').div(:class => 'headline')
    end

    def active_content_tab
      secondary_tabs.a(:class => 'active').when_present.text
    end

    def subscription_pop_up
      browser.div(:id => 'AMS_WIR_FOOTER_NAVBAR_POPUP')
    end

    def latest_blog_posts
      browser.div(:id => 'latest-blog-posts')
    end

    def hottest_web_link_entries
      browser.div(:id => 'reddit-links')
    end

    def primaty_tabs
      browser.ul(:id => 'primary-nav')
    end

    def gear_tab_content
      gear_tab.ul(:class => 'subnav')
    end

    def science_tab_content
      science_tab.ul(:class => 'subnav')
    end

    def subscribe_tab_content
      subscription_tab.div(:id => 'AMS_WIR_GLOBAL_NAVBAR_ROLLOVER')
    end

    def gear_tab
      primaty_tabs.li(:class => 'gear')
    end

    def science_tab
      primaty_tabs.li(:class => 'science')
    end

    def subscription_tab
      primaty_tabs.li(:class => 'subscribe')
    end
    
    def secondary_tabs
      browser.div(:id => 'tertiary_package').ul(:class => 'tabs')
    end

    def new_window_opened?
      browser.windows.length > 1
    end

    def new_window_url
      subscription_window.url
    end

    def subscription_window
      browser.window(:title => /^Wired Magazine Subscription/)
    end

  end
end
