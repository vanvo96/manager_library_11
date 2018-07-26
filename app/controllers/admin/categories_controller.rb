class Admin::CategoriesController < Admin::ApplicationController
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

  private

  def category_params
    params.require(:category).permit :name, :description
  end
end
