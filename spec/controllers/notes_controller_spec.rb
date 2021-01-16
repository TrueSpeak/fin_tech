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

  describe "POST #create" do
    context 'guest' do
      it 'tries to create a new note' do
        expect do
          post :create, params: { note: { user_id: another_user.id, title: 'new_title', description: 'new desc' } }
        end.to_not change(Note, :count)
      end
    end

    context 'user' do
      before { login(user) }

      it 'tries to create a new note with valid attributes' do
        expect do
          post :create, params: { note: { user_id: user.id, title: 'new_title', description: 'new desc' } }
        end.to change(Note, :count).by(1)
      end

      it 'redirect after create note' do
        post :create, params: { note: { user_id: user.id, title: 'new_title', description: 'new desc' } }
        expect(response).to redirect_to note_path(Note.last.id)
      end

      it 'tries to create a new note with invalid attributes' do
        expect do
          post :create, params: { note: { user_id: user.id } }
        end.to_not change(Note, :count)
      end

      it 'render new form when note params invalid' do
        post :create, params: { note: { user_id: user.id } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #new" do
    context 'guest' do
      it 'redirect after create note' do
        get :new
        expect(response).to redirect_to root_path
      end
    end

    context 'authenticated user' do
      before { login(user) }
      it 'redirect to new form' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let!(:note) { create(:note, user: user) }

    context 'guest' do
      it 'tries to update note' do
        patch :update, params: { id: note.id, note: { title: 'new_title', description: 'new desc' } }
        note.reload

        expect(note.title).to_not eq 'new_title'
        expect(note.description).to_not eq 'new desc'
        expect(response).to redirect_to root_path
      end
    end

    context 'owner' do
      before { login(user) }

      it 'tries to update note with valid data' do
        patch :update, params: { id: note.id, note: { title: 'new_title', description: 'new desc' } }
        note.reload

        expect(note.title).to eq 'new_title'
        expect(note.description).to eq 'new desc'
        expect(response).to redirect_to note_path(note.id)
      end

      it 'tries to update note with valid data' do
        patch :update, params: { id: note.id, note: { title: nil, description: nil } }
        note.reload

        expect(response).to render_template :edit
      end
    end

    context 'not owner' do
      before { login(another_user) }

      it 'tries to update note' do
        patch :update, params: { id: note.id, note: { title: 'new_title', description: 'new desc' } }

        note.reload

        expect(note.title).to_not eq 'new_title'
        expect(note.description).to_not eq 'new desc'
        expect(response).to redirect_to notes_path
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:note) { create(:note, user: user) }

    context 'guest' do
      it 'try to destroy note' do
        expect do
          delete :destroy, params: { id: note.id }
        end.to_not change(Note, :count)

        expect(response).to redirect_to root_path
      end
    end

    context 'owner' do
      before { login(user) }
      it 'try to destroy note' do
        expect do
          delete :destroy, params: { id: note.id }
        end.to change(Note, :count).by(-1)

        expect(response).to redirect_to notes_path
      end
    end

    context 'owner' do
      before { login(another_user) }

      it 'try to destroy note' do
        expect do
          delete :destroy, params: { id: note.id }
        end.to_not change(Note, :count)

        expect(response).to redirect_to notes_path
      end
    end
  end
end