class CreateCadastros < ActiveRecord::Migration
  def change
    create_table :cadastros do |t|
      t.integer :user_id
      t.integer :projeto_id

      t.timestamps
    end
  end
end
