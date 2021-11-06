class PagesController < ApplicationController

  def home

    @pagy, @invoices = pagy(Advance.all, items: 10)

    $logged = session[:user_id]
    if $logged
      flash[:notice] = "Inicio de sesion correctamente"

    else
      flash[:notice] = "Se debe de iniciar sesión antes de anticipar la factura"
    end


  end

end
