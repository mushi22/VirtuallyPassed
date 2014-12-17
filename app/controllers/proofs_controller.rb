class ProofsController < ApplicationController
  before_action :set_proof, only: [:show, :edit, :update, :destroy]

  # GET /proofs
  # GET /proofs.json
  def index
    @subtopic = Subtopic.find(params[:subtopic_id])
    @proofs = @subtopic.proofs
  end

  # GET /proofs/1
  # GET /proofs/1.json
  def show
  end

  # GET /proofs/new
  def new
    @subtopic = Subtopic.find(params[:subtopic_id])
    @proof = @subtopic.proofs.build
  end

  # GET /proofs/1/edit
  def edit
    @subtopic = Subtopic.find(params[:subtopic_id])
    @proof = @subtopic.proofs.find(params[:id])
  end

  # POST /proofs
  # POST /proofs.json
  def create
    @subtopic = Subtopic.find(params[:subtopic_id])    
    @proof = @subtopic.proofs.build(proof_params)

    respond_to do |format|
      if @proof.save
        format.html { redirect_to [@subtopic, @proof], notice: 'Proof was successfully created.' }
        format.json { render :show, status: :created, location: @proof }
      else
        format.html { render :new }
        format.json { render json: @proof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proofs/1
  # PATCH/PUT /proofs/1.json
  def update
    
    @subtopic = Subtopic.find(params[:subtopic_id])
    @proof = @subtopic.proofs.build
    
    respond_to do |format|
      if @proof.update(proof_params)
        format.html { redirect_to [@subtopic,@proof], notice: 'Proof was successfully updated.' }
        format.json { render :show, status: :ok, location: @proof }
      else
        format.html { render :edit }
        format.json { render json: @proof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proofs/1
  # DELETE /proofs/1.json
  def destroy
    @subtopic = Subtopic.find(params[:subtopic_id])
    @proof.destroy
    respond_to do |format|
      format.html { redirect_to subtopic_proofs_path, notice: 'Proof was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proof
      @proof = Proof.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proof_params
      params.require(:proof).permit(:name, :video_link, :content, :user_id)
    end
end
