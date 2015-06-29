require 'rails_helper'

RSpec.describe "projetos/index", type: :view do
  before(:each) do
    assign(:projetos, [
      Projeto.create!(
        :titulo => "Titulo",
        :descricao => "MyText",
        :responsavel => "Responsavel",
        :email => "Email",
        :telefone => "Telefone"
      ),
      Projeto.create!(
        :titulo => "Titulo",
        :descricao => "MyText",
        :responsavel => "Responsavel",
        :email => "Email",
        :telefone => "Telefone"
      )
    ])
  end

  it "renders a list of projetos" do
    render
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Responsavel".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
  end
end
