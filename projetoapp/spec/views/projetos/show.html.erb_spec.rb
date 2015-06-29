require 'rails_helper'

RSpec.describe "projetos/show", type: :view do
  before(:each) do
    @projeto = assign(:projeto, Projeto.create!(
      :titulo => "Titulo",
      :descricao => "MyText",
      :responsavel => "Responsavel",
      :email => "Email",
      :telefone => "Telefone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Responsavel/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Telefone/)
  end
end
