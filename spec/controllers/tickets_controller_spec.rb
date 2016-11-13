require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the tickets if user is :admin" do
      admin = User.create!(email: 'user@web2labs.net', password: 'web2labs').make_as_admin
      tickets = Ticket.all
      get :index

      expect(assigns(:tickets)).to match_array(tickets)
    end

    it "loads all of the tickets if user is :associate" do
      admin = User.create!(email: 'associate@web2labs.net', password: 'web2labs').make_as_associate
      tickets = Ticket.all
      get :index

      expect(assigns(:tickets)).to match_array(tickets)
    end
  end
end


end
