require 'rails_helper'

describe VenuesController do
  let!(:venue) { create :venue }
  let(:valid_attributes) { attributes_for(:venue) }
  let(:invalid_attributes) { attributes_for(:venue, name: '') }

  describe 'GET index' do
    it 'assigns all people as @venue' do
      get :index
      expect(assigns(:venues)).to eq([venue])
    end
  end

  describe 'GET show' do
    it 'assigns the requested venue as @venue' do
      get :show, id: venue.to_param
      expect(assigns(:venue)).to eq(venue)
    end
  end

  describe 'GET new' do
    it 'assigns a new venue @venue' do
      get :new
      expect(assigns(:venue)).to be_a_new(Venue)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested venue as @venue' do
      get :edit, id: venue.to_param
      expect(assigns(:venue)).to eq(venue)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Venue' do
        expect do
          post :create, venue: valid_attributes
        end.to change(Venue, :count).by(1)
      end

      it 'assigns a newly created book as @venue' do
        post :create, venue: valid_attributes
        expect(assigns(:venue)).to be_a(Venue)
        expect(assigns(:venue)).to be_persisted
      end

      it 'redirects to the created venue' do
        post :create, venue: valid_attributes
        expect(response).to redirect_to(Venue.last)
      end
    end

    describe 'with invalid params' do
      it "re-renders the 'new' template" do
        post :create, venue: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'POST update' do
    describe 'with valid params' do
      it 'redirects to the existing venue' do
        post :update, id: venue.to_param, venue: { name: 'New Name' }
        expect(response).to redirect_to(venue)
      end

      it 'updates existing venue' do
        post :update, id: venue.to_param, venue: { name: 'New Name' }
        venue.reload
        expect(venue.name).to eq('New Name')
      end
    end

    describe 'with invalid params' do
      it 're-renders the `edit` template' do
        post :update, id: venue.to_param, venue: { name: '' }
        expect(response).to render_template('edit')
      end
    end
  end
end
