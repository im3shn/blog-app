module ApplicationHelper
  include Pagy::Frontend
  def dob_from_parameters
    if params[:search].present?
      params[:search][:dob]
    end
  end
end
