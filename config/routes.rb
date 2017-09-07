Rails.application.routes.draw do
  #ruta que escucha /show y ejecuta el controlador mapa y la accion show
  get 'show', to: 'mapa#show', as: "show"
  #ruta que renderiza mapa/add
  get 'mapa/add'
  #ruta que setea la api /api/v1/gps para accionar el metodo de guardar
  post '/api/v1/gps', to: 'mapa#guardar'

  #ruta por defecto
  root 'mapa#add'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
