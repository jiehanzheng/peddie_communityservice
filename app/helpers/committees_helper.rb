module CommitteesHelper

  def bootstrap_row_color_class_by_spots(remaining_spots, capacity)
    case remaining_spots.to_f / capacity
    when 0 then ""  # lol this name is confusing, but it's gray, which is what I want
    when 0..0.2 then "danger"
    when 0.2..0.5 then "warning"
    else "success"
    end
  end

  def sign_up_button(shift, user)
    signup = shift.signup_by_user(user)
    if signup.blank?  # user had not signed up for this shift
      if Policy.allow_signup?(user)  # and policy says user can sign up
        if shift.has_spots?  # is not full yet
          # show sign up button
          return link_to "Sign Up", {:controller => 'signups',
                                     :action => 'new',
                                     :shift_id => shift.id},
                                    {:class => 'btn btn-primary btn-xs'}
        else
          # show full button (disabled)
          return link_to "Full", "javascript:void(0)", {:class => 'btn btn-default btn-xs disabled'}
        end
      end
    else  # user has signed up for this shift already
      if Policy.allow_cancel?(user)  # and policy says user can cancel
        # show cancel button
        return link_to "Cancel", signup, {:confirm => "Are you sure?\n\nIf you change your mind after you cancel, \nyour spot may be taken by others.", 
                                          :method => :delete,
                                          :class => 'btn btn-danger btn-xs'}
      end
    end

    # show n/a button (disabled)
    link_to "Not Allowed", "javascript:void(0)", {:class => 'btn btn-default btn-xs disabled'}
  end

end
