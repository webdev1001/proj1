class PokemonsController < ApplicationController
  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.level = 1
    @pokemon.health = 100
    @pokemon.trainer = current_trainer
    if @pokemon.save
      redirect_to trainer_path(current_trainer)
    else
      redirect_to :back
      
      # needs to flash error
      flash[:error] = @pokemon.errors.full_messages.to_sentence

    end
  end

  def new
  end
  
  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    if @pokemon.health <= 0
      @pokemon.destroy
    else
      @pokemon.save
    end
    redirect_to trainer_path(current_trainer)
  end
  def capture
    @pokemon = Pokemon.find(params[:id]) # queries poke with id that is in params
    @pokemon.trainer = current_trainer # b/c of devise, usable in controls and
    # views
    @pokemon.save
    redirect_to root_path
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name) # returns hash with name and
    # level keys
  end
end
