class Admin::CategoriesController < Admin::ApplicationController
  before_action :load_category, except: %i(index new create)

  def index
    @categories = Category.paginate(page: params[:page],
      per_page: Settings.categories_per_page)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:sun] = t ".category_created"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      flash[:sun] = t ".category_updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:sun] = t ".category_deleted"
    else
      flash[:lock] = t ".delete_failed"
    end
    redirect_to admin_categories_path
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:lock] = t "admin.categories.not_found_category"
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
