class LineDescriptionsController < ApplicationController
  # GET /line_descriptions
  # GET /line_descriptions.json
  def index
    @line_descriptions = LineDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @line_descriptions }
    end
  end

  # GET /line_descriptions/1
  # GET /line_descriptions/1.json
  def show
    @line_description = LineDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @line_description }
    end
  end

  # GET /line_descriptions/new
  # GET /line_descriptions/new.json
  def new
    @line_description = LineDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @line_description }
    end
  end

  # GET /line_descriptions/1/edit
  def edit
    @line_description = LineDescription.find(params[:id])
  end

  # POST /line_descriptions
  # POST /line_descriptions.json
  def create
    @line_description = LineDescription.new(params[:line_description])

    respond_to do |format|
      if @line_description.save
        format.html { redirect_to @line_description, :notice => 'Line description was successfully created.' }
        format.json { render :json => @line_description, :status => :created, :location => @line_description }
      else
        format.html { render :action => "new" }
        format.json { render :json => @line_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_descriptions/1
  # PUT /line_descriptions/1.json
  def update
    @line_description = LineDescription.find(params[:id])

    respond_to do |format|
      if @line_description.update_attributes(params[:line_description])
        format.html { redirect_to :action=>'index', :notice => 'Line description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @line_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_descriptions/1
  # DELETE /line_descriptions/1.json
  def destroy
    @line_description = LineDescription.find(params[:id])
    @line_description.destroy

    respond_to do |format|
      format.html { redirect_to line_descriptions_url }
      format.json { head :no_content }
    end
  end
end
