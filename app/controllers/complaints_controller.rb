class ComplaintsController < ApplicationController
  def new
  end

  def create
    sale = Sale.find_by(order_number: sale_params[:order_number])
    complaint_attributes = complaint_params.merge(sale: sale)
    Complaint.create(complaint_attributes)
    redirect_to root_path
  end

  private

  def complaint_params
    params.require(:complaint).permit(:name, :email, :phone_number, :description)
  end

  def sale_params
    params.require(:complaint).permit(:order_number, :delivery_cep)
  end
end