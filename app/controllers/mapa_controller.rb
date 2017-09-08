class MapaController < ApplicationController
	require 'pp'
  def show
    #se busca el ultimo valor de coordenadas
    @ultimo = Coordinate.last
    gon.latitude = @ultimo.latitude
    gon.longitude = @ultimo.longitude
    #data por consola
    pp gon.latitude
  end

  def guardar
    #se busca un vehiculo, si existe se ocupara para guardar la informacion relacionada
    #sino devuelve nil
  	@vehicle = Vehicle.find_by vehicle_identifier: params[:identificador]
  	puts "latitud #{params[:latitude]} longitud #{params[:longitud]} identifi #{params[:identificador]}"
  	if @vehicle.nil?
      #si el vehiculo no existe se crea
  		Vehicle.create(vehicle_identifier: params[:identificador])
      #se guardan la latitud y longitud solo si ambos parametros no son vacios
  		if !params[:latitude].blank? && !params[:longitud].blank?
  			@vehicle = Vehicle.find_by vehicle_identifier: params[:identificador]
  			puts @vehicle.id
  			Coordinate.create(latitude: params[:latitude], longitude: params[:longitud],vehicle_id: @vehicle.id )
  		end
  	else
       #se guardan la latitud y longitud solo si ambos parametros no son vacios
  		if !params[:latitude].blank? && !params[:longitud].blank?
  			@vehicle = Vehicle.find_by vehicle_identifier: params[:identificador]
  			puts @vehicle.id
  			Coordinate.create(latitude: params[:latitude].to_s, longitude: params[:longitud].to_s,vehicle_id: @vehicle.id.to_i )
  		end

  	end
  end
end
