require 'rails_helper'

describe EventsController do

  let!(:venue) { FactoryGirl.create :venue}
  let!(:event) { FactoryGirl.create :event, venue: venue }
  let(:valid_attributes) { FactoryGirl.attributes_for(:event, venue_id: venue.id) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:event, start_date: '') }

  describe "GET index" do
    it "assigns all people as @event" do
      get :index
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      get :show, id: event.to_param
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event @event" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      get :edit, id: event.to_param
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, {event: valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it "redirects to the created event" do
        post :create, {event: valid_attributes}
        expect(response).to redirect_to(Event.last)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, {event: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe 'POST update' do
    describe 'with valid params' do
      it 'redirects to the existing event' do
        post :update, { id: event.to_param, event: { start_date: '2010-01-01' } }
        expect(response).to redirect_to(event)
      end

      it 'updates existing event' do
        post :update, { id: event.to_param, event: { start_date: '2010-01-01' } }
        event.reload
        expect(event.start_date.to_s).to eq('2010-01-01')
      end
    end

    describe 'with invalid params' do
      it 're-renders the `edit` template' do
        post :update, { id: event.to_param, event: { start_date: '' } }
        expect(response).to render_template('edit')
      end
    end
  end

end