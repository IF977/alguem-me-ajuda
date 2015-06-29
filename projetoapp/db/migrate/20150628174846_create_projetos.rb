class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :titulo
      t.text :descricao
      t.string :responsavel
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
