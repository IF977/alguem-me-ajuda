class ProjetosController < ApplicationController
  before_action :set_projeto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projetos = Projeto.all
    respond_with(@projetos)
  end

  def show
    respond_with(@projeto)
  end

  def new
    @projeto = Projeto.new
    respond_with(@projeto)
  end

  def edit
  end

  def create
    @projeto = Projeto.new(projeto_params)
    @projeto.save
    respond_with(@projeto)
  end

  def update
    @projeto.update(projeto_params)
    respond_with(@projeto)
  end

  def destroy
    @projeto.destroy
    respond_with(@projeto)
  end

  private
    def set_projeto
      @projeto = Projeto.find(params[:id])
    end

    def projeto_params
      params.require(:projeto).permit(:titulo, :descricao, :responsavel, :email, :telefone)
    end
end
