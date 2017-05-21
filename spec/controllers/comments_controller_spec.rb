require 'rails_helper'
RSpec.describe CommentsController, type: :controller do
  before do
    user=create(:user)
    campaign=create(:campaign)
  end
  context 'listing' do
    it "should return all comments in the database" do
      comment1, comment2 = create(:comment), create(:comment)
      get :index, format: :json
      expect(response.body).to eql( [comment1, comment2].to_json )
    end
  end

  context 'creation' do
    it 'should create a new comment and return the newly created object in json' do
      post :create, params: {comment: attributes_for(:comment)}, format: :json

      expect(Comment.count).to eql 1

      comment = Comment.first
      expect(response.body).to eql(comment.to_json)
    end

    it 'should return bad request and the errors if validation fails' do
      post :create, params: { comment: attributes_for(:invalid_comment) }, format: :json
      comment = build(:invalid_comment)
      comment.valid?

      expect(response).to have_http_status(400)
      expect(response.body).to eql(comment.errors.full_messages.to_json)
    end
  end

  context 'editing' do
    before(:each) do
      comment = create(:comment)
    end

    it 'should update an existing comment and return the updated object in json' do
      put :update, params: { id: comment.id, todo: { content: "test" } }, format: :json

      expect(JSON.parse(response.body)['content']).not_to eql(comment.content)

      comment.reload
      expect(JSON.parse(response.body)['content']).to eql(comment.content)
    end

    it 'should return bad request and the errors if validation fails' do
      put :update, params: { id: comment.id, comment: attributes_for(:invalid_comment) }, format: :json

      comment = build(:invalid_comment)
      comment.valid?

      expect(response).to have_http_status(400)
      expect(response.body).to eql(comment.errors.full_messages.to_json)
    end
  end

  context 'deletion' do
    before(:each) do
      comment = create(:comment)
    end

    it 'should delete the given todo and return http code 200' do
      delete :destroy, params: { id: comment.id }, format: :json

      expect(Comment.count).to eql 0
      expect(response).to have_http_status(200)
    end
  end
end
