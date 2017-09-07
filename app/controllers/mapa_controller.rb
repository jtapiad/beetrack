class MapaController < ApplicationController
	require 'pp'
  def show
  	# @coords = Coord.new
  end

  def add
  	@coords = Coord.new
  end

  def guardar
  	@vehicle = Vehiculo.find_by identifier: params[:identificador]
  	puts "latitud #{params[:latitude]} longitud #{params[:longitud]} identifi #{params[:identificador]}"
  	if @vehicle.nil?
  		puts "hola1"
  		Vehiculo.create(identifier: params[:identificador])
  		if !params[:latitude].blank? && !params[:longitud].blank?
  			puts "hola2"
  			@vehicle = Vehiculo.find_by identifier: params[:identificador]
  			puts @vehicle.id
  			Coord.create(latitude: params[:latitude], longitude: params[:longitud],vehiculos_id: @vehicle.id )
  		end
  	else
  		puts "hola3"
  		if !params[:latitude].blank? && !params[:longitud].blank?
  			puts "hola4"
  			@vehicle = Vehiculo.find_by identifier: params[:identificador]
  			puts @vehicle.id
  			Coord.create(latitude: params[:latitude].to_s, longitude: params[:longitud].to_s,vehiculos_id: @vehicle.id.to_i )
  		end

  	end
  end
end
