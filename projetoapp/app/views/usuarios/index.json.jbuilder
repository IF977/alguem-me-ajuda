json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :name
  json.url usuario_url(usuario, format: :json)
end
