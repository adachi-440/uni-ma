class Users::MainRegistrationsController < ApplicationController
  before_action :set_university_name, only: [:new]
  before_action :authenticate_user!

  def new
    @user = current_user
    result = SearchUniversity.new.search_university(params[:university_name])
    @result_university = {}
    if result['results']['school'].present?
      if result['results']['results_available'] == "1"
        @result_university.merge!(result['results']['school']['name'] => result['results']['school']['name'])
      else
        result['results']['school'].each do |school|
          @result_university.merge!(school['name'] => school['name'])
        end
      end
    end
  end


  def department_search
    result = SearchUniversity.new.search_university(params[:university_name])
    @result_department = {}
    if result['results']['results_available'] == "1"
      department_divided_case(result['results']['school']['faculty'])
    else
      result['results']['school'].each do |school|
        department_divided_case(school['faculty']) if school['name'] == params[:university_name]
      end
    end
    respond_to do |format|
      format.html { redirect_to :new }
      format.json { render json: @result_department }
    end
  end


  def faculty_search
    result = SearchUniversity.new.search_university(params[:university_name])
    p result
    @result_faculty = {}
    if result['results']['results_available'] == "1"
      faculty_divided_case(result['results']['school']['faculty'])
    else
      result['results']['school'].each do |school|
        faculty_divided_case(school['faculty']) if school['name'] == params[:university_name]
      end
    end
    respond_to do |format|
      format.html { redirect_to :new }
      format.json { render json: @result_faculty }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(result_university_params)
      redirect_to profile_image_users_main_registrations_path
    else
      render :new
    end
  end

  def profile_image
    @user = current_user
  end

  def upload_profile_image
    @user = User.find(params[:main_registration_id])
    if @user.update(profile_image_params)
      redirect_to root_path
    else
      redirect_to profile_image_users_main_registrations_path
    end
  end

  private

  def result_university_params
    params.require(:user).permit(:university, :department, :faculty)
  end

  def profile_image_params
    params.require(:user).permit(:profile_image)
  end

  def set_university_name
    @university_name = params[:university_name]
  end

  def department_divided_case(faculties)
    faculties.each_with_index do |faculty, index|
      @result_department.merge!(faculty['name'] => index + 1)
    end
  end

  def faculty_divided_case(faculties)
    faculties.each do |faculty|
      if faculty['name'] == params[:department_name]
        department = faculty['department']
        if department.class == String
          @result_faculty.merge!(department => 1)
        else
          department.each_with_index do |department, index|
            @result_faculty.merge!(department => index + 1)
          end
        end
      end
    end
  end

end
