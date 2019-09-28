require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /questions/:question_id/comments" do
    before(:each) do
      User.destroy_all
    end
    it 'posts comments' do
      question = create(:question)
      sign_in question.user
      get question_path(question)
      post question_comments_path(question), params: {comment: FactoryBot.attributes_for(:comment)}
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('questions/show')
    end
  end
end
