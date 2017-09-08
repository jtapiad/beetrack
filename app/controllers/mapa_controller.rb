class MapaController < ApplicationController
	require 'pp'
  def show
    @ultimo = Coordinate.last
    gon.latitude = @ultimo.latitude
    gon.longitude = @ultimo.longitude

    p gon.latitude
  end

  def guardar
  	@vehicle = Vehicle.find_by vehicle_identifier: params[:identificador]
  	puts "latitud #{params[:latitude]} longitud #{params[:longitud]} identifi #{params[:identificador]}"
  	if @vehicle.nil?
  		puts "hola1"
  		Vehicle.create(vehicle_identifier: params[:identificador])
  		if !params[:latitude].blank? && !params[:longitud].blank?
  			puts "hola2"
  			@vehicle = Vehicle.find_by vehicle_identifier: params[:identificador]
  			puts @vehicle.id
  			Coordinate.create(latitude: params[:latitude], longitude: params[:longitud],vehicle_id: @vehicle.id )
  		end
  	else
  		puts "hola3"
  		if !params[:latitude].blank? && !params[:longitud].blank?
  			puts "hola4"
  			@vehicle = Vehicle.find_by vehicle_identifier: params[:identificador]
  			puts @vehicle.id
  			Coordinate.create(latitude: params[:latitude].to_s, longitude: params[:longitud].to_s,vehicle_id: @vehicle.id.to_i )
  		end

  	end
  end
end
