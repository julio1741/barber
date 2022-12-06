class ServicesController < ApiController
  before_action :set_service, only: %i[ show update destroy ]

  # GET /services
  def index
    @services = Service.limit(params[:limit]).offset(params[:offset])
    render json: @services
  end

  def by_org_nid
    nid = params[:nid]
    @organization = Organization.find_by(nid: nid)
    @services = Service.organization_id(@organization.id)
    render json: @services
  end

  # GET /services/1
  def show
    render json: @service
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :description, :price, :organization_id, :photo_url)
    end
end
