class API::V1::OrganisationsController < API::V1::ApiController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  # GET /organisations
  def index
    @organisations = Organisation.all
  end

  # GET /organisations/1
  def show
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations
  def create
    @organisation = Organisation.new(organisation_params)
  end

  # PATCH/PUT /organisations/1
  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation, notice: 'Organisation was successfully updated.'
    else
      render action: 'edit'
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
