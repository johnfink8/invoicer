require "pdfkit" 
class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  before_filter :authenticate_user!
  def index
    @user = current_user
    @invoices = Invoice.where(:user_id=>@user)
    #@invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html { @html = true }# show.html.erb
      format.json { @html = false
                    render :json => @invoice }
      format.pdf { @html = false 
                   @pdf = true
                   kit = PDFKit.new(render_to_string :action => 'show.html.erb',:layout => 'application.html.erb')
                   send_data kit.to_pdf,
                     :filename => "invoice-#{@invoice.recipient.name}-#{@invoice.invoiceid}.pdf",
                     :type => "application/pdf"
                   }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, :notice => 'Invoice was successfully created.' }
        format.json { render :json => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.json { render :json => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, :notice => 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end
  
  private
  def generate_pdf(invoice)
    Prawn::Document.new do
      text invoice.sender.name, :align => :center
      text "Address: #{invoice.sender.address_1}"
      text "Email: #{invoice.sender.city}"
    end.render
  end
end
