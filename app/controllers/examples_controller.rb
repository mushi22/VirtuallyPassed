class ExamplesController < ApplicationController
  before_action :set_example, only: [:show, :edit, :update, :destroy]

  # GET /examples
  # GET /examples.json
  def index
    @subtopic = Subtopic.find(params[:subtopic_id])
    @examples = @subtopic.examples
  end

  # GET /examples/1
  # GET /examples/1.json
  def show
  end

  # GET /examples/new
  def new
    @subtopic = Subtopic.find(params[:subtopic_id])
    @example = @subtopic.examples.build
  end

  # GET /examples/1/edit
  def edit
    @subtopic = Subtopic.find(params[:subtopic_id])
    @example = @subtopic.examples.find(params[:id])
  end

  # POST /examples
  # POST /examples.json
  def create
    @subtopic = Subtopic.find(params[:subtopic_id])    
    @example = @subtopic.examples.build(example_params)

    respond_to do |format|
      if @example.save
        format.html { redirect_to [@subtopic, @example], notice: 'Example was successfully created.' }
        format.json { render :show, status: :created, location: @example }
      else
        format.html { render :new }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examples/1
  # PATCH/PUT /examples/1.json
  def update
    
    @subtopic = Subtopic.find(params[:subtopic_id])
    @example = @subtopic.examples.build
    
    respond_to do |format|
      if @example.update(example_params)
        format.html { redirect_to [@subtopic,@example], notice: 'Example was successfully updated.' }
        format.json { render :show, status: :ok, location: @example }
      else
        format.html { render :edit }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1
  # DELETE /examples/1.json
  def destroy
    @subtopic = Subtopic.find(params[:subtopic_id])
    @example.destroy
    respond_to do |format|
      format.html { redirect_to subtopic_examples_path, notice: 'Example was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_params
      params.require(:example).permit(:name, :video_link, :content, :user_id)
    end
end
