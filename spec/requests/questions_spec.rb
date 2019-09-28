require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    it 'displays the lists of all questions for logged in user' do
      question = create(:question)
      sign_in question.user
      get questions_path
      expect(response.status).to eq 200
      expect(response).to render_template(:index)
    end

    it 'redirects back to login page for not logged in user' do
      question = create(:question)
      get questions_path
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "GET /questions/new" do
    it 'displays question form' do
      user = create(:user)
      sign_in user
      get new_question_path
      expect(response.status).to eq 200
      expect(response).to render_template(:new)
    end

    it 'redirects back to login page for not logged in user' do
      get new_question_path
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "GET /questions/new" do
    it 'displays question form' do
      user = create(:user)
      sign_in user
      get new_question_path
      expect(response.status).to eq 200
      expect(response).to render_template(:new)
    end

    it 'redirects back to login page for not logged in user' do
      get new_question_path
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "POST /questions" do
    it 'creates questions and redirects to questions list page' do
      user = create(:user)
      sign_in user
      get new_question_path
      post questions_path, params: {question: FactoryBot.attributes_for(:question)}
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template(:index)
    end

    it 'redirects back to login page for not logged in user' do
      get new_question_path
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "GET /questions/:id/edit" do
    it 'displays edit form' do
      question = create(:question)
      sign_in question.user
      get edit_question_path(question)
      expect(response.status).to eq 200
      expect(response).to render_template(:edit)
      # patch question_path(question), params: {question: FactoryBot.attributes_for(:question)}
      # follow_redirect!
      # expect(response.status).to eq 200
      # expect(response).to render_template(:index)
    end

    it 'redirects back to login page for not logged in user' do
      question = create(:question)
      get edit_question_path(question)
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "PATCH /questions/:id/edit" do
    it 'edit question and redirect to question list' do
      question = create(:question)
      sign_in question.user
      get edit_question_path(question)
      patch question_path(question), params: {question: FactoryBot.attributes_for(:question)}
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template(:index)
    end

    it 'redirects back to login page for not logged in user' do
      question = create(:question)
      get edit_question_path(question)
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "GET /questions/:question_id" do
    it 'displays question show page for logged in user' do
      question = create(:question)
      sign_in question.user
      get question_path(question)
      expect(response.status).to eq 200
      expect(response).to render_template(:show)
    end

    it 'redirects back to login page for not logged in user' do
      question = create(:question)
      get question_path(question)
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe "DELETE /questions/:id/edit" do
    it 'edit question and redirect to question list' do
      question = create(:question)
      sign_in question.user
      delete question_path(question)
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template(:index)
    end

    it 'redirects back to login page for not logged in user' do
      question = create(:question)
      delete question_path(question)
      follow_redirect!
      expect(response.status).to eq 200
      expect(response).to render_template('devise/sessions/new')
    end
  end

end
