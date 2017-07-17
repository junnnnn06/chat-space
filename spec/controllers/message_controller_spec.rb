require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user)}
  let(:group) { create(:group)}
  let(:message){ build(:message, user, group)}

  describe 'GET#index' do
    context 'ログインしている場合' do
    before do
      login_user user
      get :index, params: {group_id: group}
    end

        it "意図した画面に遷移するか" do
        expect(response).to render_template :index
      end

      it "messageが新しく生成されるか" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "groupが定義されているか" do
        expect(assigns(:group)).to eq(group)
      end
    end
  end

  context 'ログインしていない場合' do
    before do
      get :index, params: {group_id: group}
    end

    it "意図したビューにリダイレクトできるか" do
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST#create' do
    subject {post :create, params: { group_id: group, message: attributes_for(:message)}}

    context "ログインに成功した場合" do
      before do
        login_user user
      end
      it "メッセージの保存がされたか" do
        expect {subject}.to change(Message, :count).by(1)
      end

      it "意図した画面に遷移しているか" do
        subject
        expect(response).to redirect_to(group_messages_path)
      end
    end

    context "ログインに成功したが、保存に失敗した場合" do
      before do
        login_user user
      end
      subject {post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil)}}
      it "メッセージの保存は行われなかったか" do
        expect {subject}.not_to change(Message, :count)
      end

      it "意図したビューが描画されているか" do
        subject
        expect(response).to render_template :index
      end
    end

    context "ログインしていない場合" do
      it "意図した画面にリダイレクトできているか" do
        post :create, params: { group_id: group, message: attributes_for(:message)}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
