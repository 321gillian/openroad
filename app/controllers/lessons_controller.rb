class LessonsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lessons = Lesson.available
    @lesson_count = Lesson.available.count
    @order_item = current_order.order_items.new
    
  end

  def new
    @lesson = Lesson.new
  end 

  def create
    @lesson = Lesson.new(lesson_params)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end 
    end

    def booked
      @lesson = Lesson.find(params[:id])
      @lesson.unavailable!
    end 

    def edit
      @lesson = Lesson.find(params[:id])
    end 

    def update
      @lesson = Lesson.find(params[:id])
      respond_to do |format|
          if @lesson.update(params.require(:portfolio).permit(:title, :subtitle, :body))
            format.html { redirect_to @lesson, notice: 'Record was successfully updated.' }
            format.json { render :index, status: :ok, location: @lesson }
          else
            format.html { render :edit }
            format.json { render json: @lesson.errors, status: :unprocessable_entity }
          end
        end
    end 
 
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
    
   end 

  def show
    @lesson = Lesson.find(params[:id])
    @order_item = current_order.order_items.new
  end 

  private
  def lesson_params
    params.require(:lesson).permit(:id, :duration, :price, :meeting_point, :date, :start_time)
  end  

end
