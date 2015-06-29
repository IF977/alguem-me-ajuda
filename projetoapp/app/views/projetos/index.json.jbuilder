json.array!(@projetos) do |projeto|
  json.extract! projeto, :id, :titulo, :descricao, :responsavel, :email, :telefone
  json.url projeto_url(projeto, format: :json)
end
