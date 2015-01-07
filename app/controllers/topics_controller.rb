class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @course = Course.find(params[:course_id])
    @topics = @course.topics.order('id ASC')
  end

  def show
    @course = Course.find(params[:course_id])
    @topic = @course.topics.find(params[:id])
	@subtopics = @topic.subtopics.order('id ASC')
  end
  def slidebox
	@examples = Example.where('subtopic_id = ?',params[:subtopic_id]).order("id ASC")
	@proofs = Proof.where('subtopic_id = ?',params[:subtopic_id]).order("id DESC")
	@subtopic = Subtopic.find(params[:subtopic_id])
	render layout: false

	
  end

  def new
    @course = Course.find(params[:course_id])
    @topic = @course.topics.build
  end

  def edit
    @course = Course.find(params[:course_id])
    @topic = @course.topics.find(params[:id])    
  end

  def create
    @course = Course.find(params[:course_id])    
    @topic = @course.topics.build(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@course, @topic], notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @course = Course.find(params[:course_id])    
    @topic = @course.topics.find(params[:id])
    
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to [@course, @topic], notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to course_topics_path, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :description, :course_id)
    end
end
