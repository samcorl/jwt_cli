require 'jwt'
require 'clipboard'
require 'validates_email_format_of'

class JwtBuilder
  attr_accessor :user_id, :email_address, :jwt, :jwt_attributes
  attr_reader   :token_string

  def initialize(user_id:, email_address:)
    @user_id = user_id
    @email_address = email_address
    @jwt_attributes = {}
    @token = ''
  end

  def valid?
    email_valid? && user_id_valid?
  end

  def email_valid?
    !email_address.nil?
  end

  def user_id_valid?
    !user_id.nil?
  end

  def assign_user_id
    while user_id.nil? || user_id.empty?
      puts 'Please enter a user_id'
      @user_id = STDIN.gets.chomp
    end
  end

  def assign_email_address
    while (errors = ValidatesEmailFormatOf::validate_email_format(email_address)) || email_address.nil?
      puts errors unless email_address.nil?
      puts 'Please enter a valid email address'
      @email_address = STDIN.gets.chomp
    end
  end

  def interactive_manage_attributes
    attribute_name = nil
    while attribute_name != 'q' && attribute_name != ''
      puts "Please enter an attribute name or leave empty to stop adding attributes"
      attribute_name = STDIN.gets.chomp
      return if attribute_name == 'q' || attribute_name == ''
      puts "Please enter a value for attribute '#{attribute_name}'"
      attribute_value = STDIN.gets.chomp
      @jwt_attributes[attribute_name] = attribute_value
    end
  end

  def call
    assign_user_id
    assign_email_address
    interactive_manage_attributes
    Clipboard.copy create_token
    puts "JWT has been copied to your clipboard: #{Clipboard.paste}"
  end

  def create_token
    jwt_attributes.merge({ user_id: user_id, email: email_address })
    @token_string = JWT.encode jwt_attributes, nil, 'none'
  end
end