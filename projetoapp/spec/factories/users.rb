FactoryGirl.define do
  factory :user do
  	name "Jorge Rodrigues"
  	#matricula (CpfUtils.cpf)
  	email "jrgvf@cin.ufpe.br"
  	password "teste123"
  	password_confirmation "teste123" 
  end
end