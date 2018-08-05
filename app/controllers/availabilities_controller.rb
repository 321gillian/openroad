class AvailabilitiesController < ApplicationController
  before_action :authorize_admin
   include EnumerateHours
  def new
    @availability = Availability.new
  end 

    def create
        @availability = Availability.new(availability_params)
        respond_to do |format|
          if @availability.save
            format.html { redirect_to @availability, notice: 'availability was successfully created.' }
            format.json { render :show, status: :created, location: @availability }
          else
            format.html { render :new }
            format.json { render json: @availability.errors, status: :unprocessable_entity }
          end
        end 
       @available_hours = enumerate_hours(@availability.start_time, @availability.end_time)
        Lesson.create!(@available_hours.map {|ar_date| {start_time: ar_date}})
    end

    
    

    def show
        @availability = Availability.find(params[:id])
        redirect_to controller: 'lessons', start_date: @availability.start_time
      end 

      private
      def availability_params
        params.require(:availability).permit(:start_time, :end_time)
      end 
      def lesson_params
        params.require(:lesson).permit(:start_time, :id)
      end 

      def authorize_admin
        redirect_to root_path, alert: "Permissions denied" unless
         current_user.admin?
      end
    
end
