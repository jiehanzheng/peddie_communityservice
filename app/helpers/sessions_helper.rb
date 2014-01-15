module SessionsHelper

  def signin_path(origin)
    if origin.blank?
      "/auth/peddie"
    else
      "/auth/peddie?" + { :origin => origin }.to_query
    end
  end

end
