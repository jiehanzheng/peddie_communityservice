module ApplicationHelper

  class BootstrapNavTabBuilder < TabsOnRails::Tabs::Builder
    def open_tabs(options = {})
      @context.tag("ul", { :class => "nav" }, open = true)
    end

    def close_tabs(options = {})
      "</ul>".html_safe
    end

    def tab_for(tab, name, options, item_options = {})
      item_options[:class] = (current_tab?(tab) ? 'active' : '')
      @context.content_tag(:li, item_options) do
        @context.link_to(name, options)
      end
    end
  end


  def quota_badge(quota_remaining)
    t = Settings.appearance.badges.quota_remaining_thresholds
    inf = 1.0/0

    class_suffix = case quota_remaining
                     when t.success..inf then 'success'
                     when t.info..t.success then 'info'
                   end

    "<span class=\"badge badge-#{class_suffix}\">#{quota_remaining}</span>".html_safe
  end

  def spots_badge(spots_count)
    t = Settings.appearance.badges.spots_count_thresholds
    inf = 1.0/0

    class_suffix = case spots_count
                     when t.success..inf then 'success'
                     when t.info..t.success then 'info'
                     when t.warning..t.info then 'warning'
                     when t.important..t.warning then 'important'
                     when t.inverse..t.important then 'inverse'
                   end

    "<span class=\"badge badge-#{class_suffix}\">#{spots_count}</span>".html_safe
  end
  
end
