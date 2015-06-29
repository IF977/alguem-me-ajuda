class Cadastro < ActiveRecord::Base
  
  attr_accessible :projeto_id, :user_id
 
  belongs_to :users
  belongs_to :projetos
end
