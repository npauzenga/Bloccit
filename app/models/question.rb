class Question < ActiveRecord::Base
  has_many :answers


    def display_resolved
      if @question.resolved
        "This question has been resolved."
      else
        "This question needs an answer!"
      end
    end
end
