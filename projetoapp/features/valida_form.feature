#language: pt
Feature: Usuários da aplicação
    Afim de ter contatos contatos na aplicação
    Como dono da aplicação
    Eu gostaria que esses contatos fossem salvos no sistema

Scenario: Cadastro de usuarios
    Dado que estou na pagina de cadastro
    E preencho o formulario
    Entao eu deveria ver meu cadastro na lista
