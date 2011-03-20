class ChefReportsController < ApplicationController
  # GET /chef_reports
  # GET /chef_reports.xml
  def index
    @chef_reports = ChefReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chef_reports }
    end
  end

  # GET /chef_reports/1
  # GET /chef_reports/1.xml
  def show
    @chef_report = ChefReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chef_report }
    end
  end

  # GET /chef_reports/new
  # GET /chef_reports/new.xml
  def new
    @chef_report = ChefReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chef_report }
    end
  end

  # GET /chef_reports/1/edit
  def edit
    @chef_report = ChefReport.find(params[:id])
  end

  # POST /chef_reports
  # POST /chef_reports.xml
  def create
    @chef_report = ChefReport.new(params[:chef_report])

    respond_to do |format|
      if @chef_report.save
        format.html { redirect_to(@chef_report, :notice => 'Chef report was successfully created.') }
        format.xml  { render :xml => @chef_report, :status => :created, :location => @chef_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chef_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chef_reports/1
  # PUT /chef_reports/1.xml
  def update
    @chef_report = ChefReport.find(params[:id])

    respond_to do |format|
      if @chef_report.update_attributes(params[:chef_report])
        format.html { redirect_to(@chef_report, :notice => 'Chef report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chef_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_reports/1
  # DELETE /chef_reports/1.xml
  def destroy
    @chef_report = ChefReport.find(params[:id])
    @chef_report.destroy

    respond_to do |format|
      format.html { redirect_to(chef_reports_url) }
      format.xml  { head :ok }
    end
  end
end
