class AnswersController < ApplicationController
    # This file was generated with the command:
    # rails g controller answers --skip-template-engine
    # The skip-template-engine option just skips
    # generating a folder '/views/answers'
    
    def create 
        # POST PATH = /questions/:question_id/answers
        @question = Question.find params[:question_id]
        # @question = { id: 1, title: 'your question title', body: 'your question body', ...}
        @answer = Answer.new answer_params
        # @answer = { body: 'your answer' }
        @answer.question = @question # @answer = { body: 'your answer', question_id: 1 }
        @answer.user=current_user
        if @answer.save
            redirect_to question_path(@question)
        else 
            # For the list of answers
            @answers = @question.answers.order(created_at: :desc)
            render 'questions/show'
        end
    end

    def destroy
        # DELETE PATH = /questions/:question_id/answers/:id
        @answer = Answer.find params[:id]
        if can?(:crud,@answer)
        @answer.destroy 
        redirect_to question_path(@answer.question)
        else
            head:unauthorised
        end
    end

    private

    def answer_params 
        params.require(:answer).permit(:body)
    end
end
