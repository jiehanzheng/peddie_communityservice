require 'spec_helper'

describe SessionsController do

  it "doesn't confuses two users" do
    allow(controller).to receive(:auth_hash).and_return({ :provider => 'peddie',
                                                          :uid      => 'some_uid',
                                                          :info     => { :first_name => 'John',
                                                                         :last_name  => 'Doe',
                                                                         :email      => 'jdoe-14@peddie.org' }})
    get :create
    user1_id = session[:user_id]

    allow(controller).to receive(:auth_hash).and_return({ :provider => 'peddie',
                                                          :uid      => 'some_other_uid',
                                                          :info     => { :first_name => 'John',
                                                                         :last_name  => 'Doe Two',
                                                                         :email      => 'jdoetwo-14@peddie.org' }})
    get :create
    user2_id = session[:user_id]

    expect(user1_id).to_not eq(user2_id)
  end

  it "current_user is in fact based on user_id stored in session" do
    session[:user_id] = 100
    expect(controller.current_user).to be nil
  end

end
