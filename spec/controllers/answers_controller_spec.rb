require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:question) { create :question }

  describe 'POST #create' do

  	context 'with valid attributes' do
  		it 'saves new answer in the database' do
  			expect { post :create, answer: attributes_for(:answer), question_id: question, format: :json }.to change(question.answers, :count).by(1)
  		end

  	#	it 'render create template' do
  	#		post :create, answer: attributes_for(:answer), question_id: question, format: :json
  	#		expect(response).to render @answer
  	#	end
    end

    context 'with invalid attributes' do
    	it 'does not save the question' do
    		expect { post :create, answer: attributes_for(:invalid_answer), question_id: question, format: :json }.to_not change(Answer, :count)
    	end

  	#	it 'render create template' do
    #		post :create, answer: attributes_for(:answer), question_id: question, format: :json
  	#		expect(response).to render_template :create
  	#	end    	
    end
  end

  describe 'PATCH #update' do
    let(:answer) { create(:answer, question: question) }

    it 'assigns the requested answer to @answer' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(assigns(:answer)).to eq answer
    end

    it 'assigns the question' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(assigns(:question)).to eq question
    end
    
    it 'changes answer attributes' do
      patch :update, id: answer, question_id: question, answer: { body: 'new body' }, format: :js
      answer.reload
      expect(answer.body).to eq 'new body'
    end

    it 'render update template' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(response).to render_template :update
    end
  end
end
