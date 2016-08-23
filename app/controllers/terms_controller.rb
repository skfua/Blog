class TermsController < ApplicationController
  def new
  end

  def create
    @term = Term.new(term_params)
    if @term.valid?
    @term.save
    render action: "show"
    else
      render action: "new"
    end
  end

  def show

  end

  private
  def term_params
    params.require(:term).permit(:title, :body)
  end
end
