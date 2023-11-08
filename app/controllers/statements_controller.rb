class StatementsController < ApplicationController
  before_action :set_statement, only: %i[ show edit update destroy ]

  # GET /statements or /statements.json
  def index
    @statements = Statement.all
  end

  # GET /statements/1 or /statements/1.json
  def show
  end

  # GET /statements/new
  def new
    @statement = Statement.new
  end

  # GET /statements/1/edit
  def edit
    @statement = Statement.new
  end

  # POST /statements or /statements.json
  def create
    content = statement_params[:content]
    convention = statement_params[:convention]
    @statement = Statement.new(content: content, convention: convention)
    @situation = Situation.find(statement_params[:situation_id])
    @correct = statement_params[:correct]

    respond_to do |format|
      if @statement.save
        Choice.create(situation_id: @situation.id, statement_id: @statement.id, correct: @correct)
        format.html { redirect_to edit_situation_url(@situation), notice: "Statement was successfully created." }
        format.json { render :show, status: :created, location: @statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statements/1 or /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to statement_url(@statement), notice: "Statement was successfully updated." }
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1 or /statements/1.json
  def destroy
    @statement.destroy

    respond_to do |format|
      format.html { redirect_to statements_url, notice: "Statement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statement_params
      params.require(:statement).permit(:convention, :content, :correct, :situation_id)
    end
end
