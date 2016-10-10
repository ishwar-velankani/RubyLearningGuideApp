class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end
	def create
		
		#render plain: params[:question].inspect
		@question = Question.new(question_params)
		
		if @question.save
			redirect_to @question
		else
			render 'new'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

	def update
  		@question = Question.find(params[:id])
 
  		if @question.update(question_params)
    		redirect_to @question
  		else
    		render 'edit'
  		end
	end
	def show
		@question = Question.find(params[:id])
	end

	def index
		@questions = Question.all
	end
	private
		def question_params
			params.require(:question).permit(:question,:option1,:option2,:option3,:option4,:correct_option)
		end
end
