class Admin::PublishersController < Admin::ApplicationController
  before_action :load_publisher, except: %i(index new create)

  def index
    @publishers = Publisher.paginate(page: params[:page],
      per_page: Settings.publisher_per_page)
  end

  def new
    @publisher = Publisher.new
  end

  def edit; end

  def update
    if @publisher.update_attributes(publisher_params)
      flash[:sun] = t ".publisher_updated"
      redirect_to admin_publishers_path
    else
      render :edit
    end
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash[:sun] = t ".publisher_created"
      redirect_to admin_publishers_path
    else
      render :new
    end
  end

  def destroy
    if @publisher.destroy
      flash[:sun] = t ".publisher_deleted"
    else
      flash[:lock] = t ".delete_failed"
    end
    redirect_to admin_publishers_path
  end

  private

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:lock] = t "admin.publishers.not_found_publisher"
    redirect_to admin_publishers_path
  end

  def publisher_params
    params.require(:publisher).permit :name, :location
  end
end
