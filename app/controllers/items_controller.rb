class ItemsController < ApplicationController
  before_action :set_item_status, only: [:new]
  before_action :set_category, only: [:new]
  before_action :set_sub_category, only: [:new]
  before_action :set_lecture_term, only: [:new]

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @item = Item.new
    @item.images.build
    @item.build_lecture
  end

  def department_category_search
    department_categories = ItemDepartmentCategory.where(item_sub_category_id: params[:item_sub_category_id])
    respond_to do |format|
      format.html { redirect_to :new }
      format.json { render json: department_categories }
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(
      :name,
      :explanation,
      :item_category_id,
      :item_department_category_id,
      :price,
      :place,
      :item_status_id,
      :item_sold_status_id,
      images_attributes: [:name, :id],
      tags_attributes: %i(id item_id name),
      lecture_attributes: %i(id item_id name teacher lecture_term_id explanation)
    ).merge!(user_id: current_user.id)
  end

  def set_item_status
    @item_statuses = ItemStatus.all
  end

  def set_category
    @categories = ItemCategory.all
  end

  def set_sub_category
    @sub_categories = ItemSubCategory.all
    @sub_categories = @sub_categories.map {|sub_category| [sub_category.label, sub_category.id]}
  end
  def set_lecture_term
    @lecture_terms = LectureTerm.all
  end

end
