require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

  describe "GET #show" do
    let!(:note) { create(:note, user: user) }

    context "when guest tries to get show template" do
      before do
        get :show, params: { id: note.id }
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context "when owner tries to get show template" do
      before do
        login(user)
        get :show, params: { id: note.id }
      end

      it 'render show view' do
        expect(response).to render_template(:show)
      end
    end

    context "when not owner tries to get show template" do
      before do
        login(another_user)
        get :show, params: { id: note.id }
      end

      it 'render show view' do
        expect(response).to render_template(:show)
      end
    end

    context 'when another user try to get show template of private note' do
      let!(:private_note) { create(:note, user: user, private_note: true) }
      before do
        login(another_user)
        get :show, params: { id: private_note.id }
      end

      it 'redirect to notes path' do
        expect(response).to redirect_to notes_path
      end
    end
  end

  describe "GET #index" do
    let!(:notes) { create_list(:note, 3, user: user) }


    context "when guest tries to get index template" do
      before do
        get :index
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context "when authenticated user tries to get index template" do
      before do
        login(user)
        get :index
      end

      it 'render show view' do
        expect(response).to render_template(:index)
      end

      it 'match array Notes' do
        expect(notes).to match_array(Note.all)
      end
    end
  end

  describe "GET #edit" do
    let!(:note) { create(:note, user: user) }


    context "when guest tries to get edit template" do
      before do
        get :edit, params: { id: note.id }
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context "when owner tries to get edit template" do
      before do
        login(user)
        get :edit, params: { id: note.id }
      end

      it 'render edit view' do
        expect(response).to render_template(:edit)
      end
    end

    context "when not owner tries to get edit template" do
      before do
        login(another_user)
        get :edit, params: { id: note.id }
      end

      it 'redirect to notes_path' do
        expect(response).to redirect_to notes_path
      end
    end
  end
end