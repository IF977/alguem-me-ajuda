require 'rails_helper'

RSpec.describe "projetos/new", type: :view do
  before(:each) do
    assign(:projeto, Projeto.new(
      :titulo => "MyString",
      :descricao => "MyText",
      :responsavel => "MyString",
      :email => "MyString",
      :telefone => "MyString"
    ))
  end

  it "renders new projeto form" do
    render

    assert_select "form[action=?][method=?]", projetos_path, "post" do

      assert_select "input#projeto_titulo[name=?]", "projeto[titulo]"

      assert_select "textarea#projeto_descricao[name=?]", "projeto[descricao]"

      assert_select "input#projeto_responsavel[name=?]", "projeto[responsavel]"

      assert_select "input#projeto_email[name=?]", "projeto[email]"

      assert_select "input#projeto_telefone[name=?]", "projeto[telefone]"
    end
  end
end
