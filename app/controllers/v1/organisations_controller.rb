class V1::OrganisationsController < V1::ApiController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  # GET /organisations
  def index
    render json: Organisation.all
  end

  # GET /organisations/1
  def show
    render json: @organisation
  end

  # POST /organisations
  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      render json: @organisation, status: :created
    else
      render json: @organisation, status: :not_acceptable
    end
  end

  # PATCH/PUT /organisations/1
  def update
    if @organisation.update(organisation_params)
      render json: @organisation
    else
      render json: @organisation, status: :not_acceptable
    end
  end

  # DELETE /organisations/1
  def destroy
    @organisation.destroy
    render json: success_json
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def organisation_params
    params.require(:organisation).permit(:name)
  end
end
