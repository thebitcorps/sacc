class DossiersController < ApplicationController

  def documentize
    @client = Client.find(params[:client_id])
    @client.build_dossier
    @client.save
    @client.dossier.build_general_check_list
    if(@client.marital_status == 'married')
      @client.dossier.build_general_spouse_check_list
    end
    @client.dossier.save
    redirect_to @client.dossier, notice: 'Dossier was successfully created.'
  end

  def show
    @dossier = Dossier.find(params[:id])
    @client = @dossier.client
  end

  private
      def set_client
         
      end
end
