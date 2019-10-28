class ComplaintsController < ApplicationController
  def new
    @complaint = Complaint.new
  end

  def create
    sale = Sale.find_by(order_number: sale_params[:order_number])
    complaint_attributes = complaint_params.merge(sale: sale)

    @complaint = Complaint.new(complaint_attributes)
    if @complaint.save
      redirect_to root_path(@complaint), notice: 'Reclamação criada com sucesso'
    else
      render :new
    end
  end

  private

  def complaint_params
    params.require(:complaint).permit(:name, :email, :phone_number, :description)
  end

  def sale_params
    params.require(:complaint).permit(:order_number, :delivery_cep)
  end
end