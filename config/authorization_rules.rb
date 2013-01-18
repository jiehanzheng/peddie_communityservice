authorization do
  role :guest do
    has_permission_on :committees, :to => :read
  end

  role :user do
    has_permission_on :committees, :to => :read

    has_permission_on :signups, :to => :read
    has_permission_on :signups, :to => :create
    has_permission_on :signups, :to => :destroy do
      if_attribute :user => is { user }
    end
  end
  
  role :admin do
    has_permission_on :committees, :to => :manage
    has_permission_on :signups, :to => :manage
    has_permission_on :users, :to => :manage
  end
  
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end