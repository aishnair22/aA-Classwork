class Api::PartiesController < ApplicationController
  def index
    @parties = Party.all
    render :index
  end

  def show
    @party = Party.includes(guests: [:gifts]).find_by(id: params[:id])
    render :show
  end
end

# {
#    name: PartyName,
#    guests: {
#        guest1: {
#            name: guest'sName,
#            gifts: {
#                gift1: {
#                    title: giftTitle
#                 }
#            }
#        }
#    } 
# }
