class Projeto < ActiveRecord::Base
  include ValidateEmailHelper
  has_many :cadastros
  has_many :users, through: :cadastros, source: :users
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :titulo, presence: true, length: {maximum: 250}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX}
  validate :verify_errors, :verify_email
  validates :responsavel, presence: true, length: {maximum: 250}, uniqueness: { case_sensitive: false }
  validates :descricao, presence: true, length: {maximum: 500}, uniqueness: { case_sensitive: false }
  
  private

  def verify_errors
    errors.messages.each do |field, erro|
        erro.uniq!
    end
  end
  
  def verify_email
    return if email.blank?
    result = get_response_email(email)
    errors.add(:email, "não existe! Verifique.") if result==nil || result["result"] == "invalid"
  end
  
  
  
end
