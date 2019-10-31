class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def new
    @complaint = Complaint.new
  end

  def create
    sale = Sale.find_by(order_number: complaint_params[:order_number])
    complaint_attributes = complaint_params.merge(sale: sale)

    @complaint = Complaint.new(complaint_attributes.merge(request_ip: remote_ip))
    if @complaint.save
      DetermineComplaintSafetyJob.perform_later(remote_ip, @complaint)
      redirect_to root_path(@complaint), notice: 'Reclamação criada com sucesso'
    else
      render :new
    end
  end

  private

  def remote_ip
    if Rails.env.production?
      request.remote_ip
    else
      Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    end
  end

  def complaint_params
    params.require(:complaint).permit(:name, :email, :phone_number, :description,
      :order_number, :delivery_cep)
  end
end