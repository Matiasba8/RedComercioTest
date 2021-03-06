class InvoicesController < ApplicationController

  # GET anticipate_invoice
  def anticipate_invoice
  end

  def pay_invoice

    puts "logged: #{$logged}"
    @advance = Advance.new(debtor: params[:debtor],date: Date.today, invoice_number: params[:invoice_number], final_amount: params[:final_amount], status: params[:status],advance_per: params[:advance_per], user_id: $logged)

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

  # render edit form
  def edit
    $advance = Advance.find_by(id: params[:id])
    $advance_id = $advance.id
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update

    $advance = Advance.find_by(id: $advance_id)

    respond_to do |format|
      if $advance.update(advance_params)
        format.html { redirect_to root_path notice: "Advance was successfully updated." }
        format.json { render :show, status: :ok, location: @advance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE
  def delete_advance
    @invoice = Advance.find_by(id: params[:id])

    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Advance.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def advance_params
    begin
      params.permit(:debtor, :date,:invoice_number, :advance_per, :status, :user, :final_amount, :user_id)
    rescue
    end


  end




end
