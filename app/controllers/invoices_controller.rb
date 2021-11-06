class InvoicesController < ApplicationController

  # GET anticipate_invoice
  def anticipate_invoice
  end

  def pay_invoice
    @advance = Advance.new(debtor: params[:debtor],date: Date.today, invoice_number: params[:invoice_number], final_amount: params[:final_amount], status: params[:status],advance_per: params[:advance_per])

    puts "result: #{@advance.advance_per.to_f/100*@advance.final_amount}"

    @advance.final_amount = @advance.advance_per.to_f/100*@advance.final_amount



    puts "final_amount #{@advance.final_amount}"

    respond_to do |format|
      if @advance.save
        # we set the recent created user as the current connection
        format.html { redirect_to root_path } #, notice: "User was successfully created."
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Only allow a list of trusted parameters through.
  def advance_params
    begin
      params.permit(:debtor, :date,:invoice_number, :advance_per, :status)
    rescue
    end


  end


end