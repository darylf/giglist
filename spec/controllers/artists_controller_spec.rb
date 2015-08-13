require 'rails_helper'

describe ArtistsController do

  let!(:artist) { FactoryGirl.create :artist }
  let(:valid_attributes) { FactoryGirl.attributes_for(:artist) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:artist, name: '') }

  describe "GET index" do
    it "assigns all people as @artist" do
      get :index
      expect(assigns(:artists)).to eq([artist])
    end
  end

  describe "GET show" do
    it "assigns the requested artist as @artist" do
      get :show, id: artist.to_param
      expect(assigns(:artist)).to eq(artist)
    end
  end

  describe "GET new" do
    it "assigns a new artist @artist" do
      get :new
      expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe "GET edit" do
    it "assigns the requested artist as @artist" do
      get :edit, id: artist.to_param
      expect(assigns(:artist)).to eq(artist)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "creates a new Artist" do
        expect {
          post :create, {artist: valid_attributes}
        }.to change(Artist, :count).by(1)
      end

      it "assigns a newly created book as @artist" do
        post :create, {:artist => valid_attributes}
        expect(assigns(:artist)).to be_a(Artist)
        expect(assigns(:artist)).to be_persisted
      end

      it "redirects to the created artist" do
        post :create, {artist: valid_attributes}
        expect(response).to redirect_to(Artist.last)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, {artist: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe 'POST update' do
    describe 'with valid params' do
      it 'redirects to the existing artist' do
        post :update, { id: artist.to_param, artist: { name: 'New Name' } }
        expect(response).to redirect_to(artist)
      end

      it 'updates existing artist' do
        post :update, { id: artist.to_param, artist: { name: 'New Name' } }
        artist.reload
        expect(artist.name).to eq('New Name')
      end
    end

    describe 'with invalid params' do
      it 're-renders the `edit` template' do
        post :update, { id: artist.to_param, artist: { name: '' } }
        expect(response).to render_template('edit')
      end
    end
  end

end