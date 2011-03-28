class ChefReportsController < ApplicationController

  def index
    @ok_reports = ChefReport.ok
    @missing_reports = ChefReport.missing
    @failed_reports = ChefReport.failed
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => ChefReports.all }
    end
  end

  def create
    @chef_report = ChefReport.find_or_initialize_by_node(params[:chef_report][:node])

    respond_to do |format|
      if @chef_report.update_attributes(params[:chef_report])
        format.html { redirect_to(@chef_report, :notice => 'Chef report was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @chef_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @chef_report = ChefReport.find_by_id(params[:id])
    @chef_report.destroy if @chef_report

    respond_to do |format|
      format.html { redirect_to(chef_reports_url) }
      format.json  { head :ok }
    end
  end
end
