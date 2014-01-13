module ApplicationHelper

  def bootstrap_glyphicon(name)
    "<span class=\"glyphicon glyphicon-#{name}\"></span>".html_safe
  end

  def eligibility_notice(user)
    html = '<div class="alert alert-info">'

    html << '<strong>' + 'Welcome, ' + h(user.first_name) + "!" + '</strong>' + '&nbsp;'*2
    if user.is_student?
      # eligibility
      html << Phase.current[:notice].gsub(/ {2,}/) {'&nbsp;'*$&.length} + '&nbsp;'*2
      html << "According to our records, you are "
      if Policy.allow_signup?(user)
        html << "allowed to sign up for " + Policy.signup_quota_remaining(user).to_s + ' more ' + 'shift'.pluralize(Policy.signup_quota_remaining(user))
      else
        html << "not allowed to sign up for more shifts"
      end
      html << " today." + '&nbsp;'*2

      # signed up info
      if user.num_signups > 0
        html << "You have currently signed up for " + user.num_signups.to_s + ' ' + 'shift'.pluralize(user.num_signups) + ":"
        html << '<ul>'
        user.signups.each do |signup|
          html << '<li>' + link_to(signup.shift.committee.name, signup.shift.committee, :class => "alert-link") + ', ' + 'shift #' + h(signup.shift.position) + ', ' + h(signup.shift.friendly_start_time) + '&ndash;' + h(signup.shift.friendly_end_time) + '</li>'
        end
        html << '</ul>'
      else
        html << "You haven&rsquo;t signed up for any shifts yet." + '&nbsp;'*2
      end
    else
      html << "You are a faculty member, so you cannot sign up for events, but you are welcome to view anything!"
    end

    html << '</div>'

    html.html_safe
  end

end
