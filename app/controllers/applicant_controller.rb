class ApplicantController < ApplicationController

  def update
    @applicant = current_applicant
    @applicant.update_attributes(params[:applicant])

    if params[:download]
      send_data generate_pdf_archive(HousingForm.all, current_applicant),
        filename: 'housingforms.zip',
        type: 'application/zip'
    else
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render action: "refresh_form" }
      end
    end
  end

end
