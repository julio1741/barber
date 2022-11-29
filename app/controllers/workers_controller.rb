class WorkersController < ApiController

  before_action :find_worker, except: %i[create index]
  before_action :set_organization_by_nid

  # GET /workers
  def index
    @workers = Worker.limit(params[:limit]).offset(params[:offset])
    @workers = @workers.organization_id(@organization.id) if @organization.present?
    render json: @workers, status: :ok
  end

  # GET /workers/{id}
  def show
    render json: @worker, status: :ok
  end

  def available_hours
    day = params[:day]
    @block_times, @work_day = worker_availability(day, @worker)
    render json: {block_times: @block_times.sort_by(&:id).sort_by(&:start), work_day: @work_day}, status: :ok
  end

  # POST /workers
  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      render json: { worker: @worker, total: Worker.count }, status: :created
    else
      render json: { errors: @worker.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /workers/{id}
  def update
    unless @worker.update(worker_params)
      render json: { errors: @worker.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /workers/{id}
  def destroy
    @worker.destroy
  end

  private

  def find_worker
    @worker = Worker.find_by_id!(worker_params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Worker not found' }, status: :not_found
  end

  def worker_params
    params.permit(
      :id, :name, :instagram, :image_url, :organization_id
    )
  end
end
