# Create a program that uses the CPF_CNPJ gem to validate a CPF number
# The CPF number should be passed as a parameter and inserted by the user

require 'cpf_cnpj'

def validate_cpf(cpf)
	if CPF.valid?(cpf)
		puts "The CPF is valid" 
	else
		puts "The CPF is invalid"
  end
end

puts "Enter the CPF number without dots or dashes"
cpf = gets.chomp

validate_cpf(cpf)