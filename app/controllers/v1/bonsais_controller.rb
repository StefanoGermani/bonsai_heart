class V1::BonsaisController < V1::ApiController
  before_action :set_bonsai, only: [:show, :edit, :update, :destroy]

  # GET /bonsais
  def index
    render json: Bonsai.all
  end

  # GET /bonsais/1
  def show
    render json: @bonsai
  end

  # POST /bonsais
  def create
    @bonsai = Bonsai.new(bonsai_params)
    if @bonsai.save
      render json: @bonsai, status: :created
    else
      render json: @bonsai, status: :bad_request
    end
  end

  # PATCH/PUT /bonsais/1
  def update
    if @bonsai.update(bonsai_params)
      render json: @bonsai
    else
      render json: @bonsai, status: :bad_request
    end
  end

  # DELETE /bonsais/1
  def destroy
    if @bonsai.destroy
      render nothing: true, status: :no_content
    else
      render nothing: true, status: :bad_request
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bonsai
    @bonsai = Bonsai.find(params[:id])
    if not @bonsai
      render nothing: true, status: :not_found
    end
  end

  # Only allow a trusted parameter "white list" through.
  def bonsai_params
    params.require(:bonsai).permit(:name)
  end
end
