class IndexController < ApplicationController
before_action :authorize
  def index
    num_error = 0
    n = params[:n]
    @res = []
    if is_number?(n)
      if n.to_i <= 10 ** 6
        respond_to do |format|
          format.html
          format.json do
            render json: { value: Palindrome.where(value: n).first_or_create.get_resulte }
          end
        end
        else
        num_error += 1
      end
    else
      num_error += 1
    end
    if num_error != 0
      @error = "Неверный формат данных"
      respond_to do |format|
        format.html
        format.json do render json: {value: @error}
        end
      end
    end
  end

  def is_number? string
    true if Float(string) rescue false
  end
end
