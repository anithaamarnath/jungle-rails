class Admin::CategoriesController < Admin::AdminController
  def index
   @category = Category.all.order(created_at: :desc)

  end
  def new
    @categorys = Category.new
  end

  def create
    @categorys = Category.new(category_params)

    if @categorys.save
      redirect_to [:admin, :categories], notice: 'New Categories created!'
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(:name)
  end
end
