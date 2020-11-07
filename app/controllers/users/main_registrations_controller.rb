class Users::MainRegistrationsController < ApplicationController
  before_action :set_university_name, only: [:new, :university_edit]
  before_action :authenticate_user!

  def new
    @user = current_user
    university_divide_case(params[:university_name])
  end

  def university_edit
    @user = current_user
    @result_department = []
    @result_faculty = []
    if @university_name.nil?
      set_selected_school
      university_divide_case(@selected_university)
      department_search_process(@selected_university)
      faculty_search_process(@selected_university, @selected_department)
    else
      university_divide_case(params[:university_name])
    end
  end

  def profile_image_edit
    @user = current_user
  end

  def department_search
    @result_department = []
    department_search_process(params[:university_name])
    respond_to do |format|
      format.html { redirect_to :new }
      format.json { render json: array_to_json(@result_department) }
    end
  end

  def faculty_search
    @result_faculty = []
    faculty_search_process(params[:university_name], params[:department_name])
    respond_to do |format|
      format.html { redirect_to :new }
      format.json { render json: array_to_json(@result_faculty) }
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
    @user = current_user
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

  def set_selected_school
    @selected_university = @user.university? ? @user.university : ''
    @selected_department = @user.department? ? @user.department : ''
    @selected_faculty = @user.faculty? ? @user.faculty : ''
  end

  def university_divide_case(university)
    result = SearchUniversity.new.search_university(university)
    @result_university = []
    return if result['results']['school'].blank?

    if result['results']['results_available'] == '1'
      @result_university.push(result['results']['school']['name'])
    else
      result['results']['school'].each do |school|
        @result_university.push(school['name'])
      end
    end
  end

  def department_search_process(university)
    result = SearchUniversity.new.search_university(university)
    if result['results']['results_available'] == '1'
      department_divided_case(result['results']['school']['faculty'])
    else
      result['results']['school'].each do |school|
        department_divided_case(school['faculty']) if school['name'] == university
      end
    end
  end

  def faculty_search_process(university, department)
    result = SearchUniversity.new.search_university(university)
    if result['results']['results_available'] == '1'
      faculty_divided_case(result['results']['school']['faculty'], department)
    else
      result['results']['school'].each do |school|
        faculty_divided_case(school['faculty'], params[:department_name]) if school['name'] == department
      end
    end
  end

  def department_divided_case(faculties)
    faculties.each_with_index do |faculty|
      @result_department.push(faculty['name'])
    end
  end

  def faculty_divided_case(faculties, department_name)
    faculties.each do |faculty|
      next unless faculty['name'] == department_name

      department = faculty['department']
      if department.class == String
        @result_faculty.push(department)
      else
        department.each_with_index do |dep|
          @result_faculty.push(dep)
        end
      end
    end
  end

  def array_to_json(array)
    j = {}
    array.each do |arr|
      j.merge!(arr => arr)
    end
    j
  end
end
