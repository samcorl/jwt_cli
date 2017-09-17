require 'test_helper'

describe JwtBuilder do
  let(:klass) { JwtBuilder }
  let(:valid_user_id) { '123' }
  let(:valid_email_address) { 'sam@samcorl.com' }
  subject { klass.new(user_id: valid_user_id, email_address: valid_email_address) }

  describe '#initialize' do
    describe 'GIVEN user_id and email are specified' do
      it 'Creates a valid JwtBuilder object' do
        expect(subject.valid?).to be true
      end
    end
  end

  describe '#assign_user_id' do
    it 'Assigns the user_id entered from the command line' do
      subject.user_id = nil
      allow(STDIN).to receive_message_chain(:gets).and_return(valid_user_id)
      allow(STDOUT).to receive_message_chain(:puts).and_return(nil)
      subject.assign_user_id
      expect(subject.user_id).to eq valid_user_id
    end
  end

  describe '#assign_email_address' do
    it 'Assigns the email_address entered from the command line' do
      subject.email_address = nil
      allow(STDIN).to receive_message_chain(:gets).and_return(valid_email_address)
      allow(STDOUT).to receive_message_chain(:puts).and_return(nil)
      subject.assign_email_address
      expect(subject.email_address).to eq valid_email_address
    end
  end

  describe '#create_token' do
    it 'Creates a valid JWT token string' do
      expect(subject.create_token).to_not eq nil
      expect(subject.create_token.class).to be String
    end
  end

  describe '#call' do
    describe 'GIVEN a valid user and email' do
      it 'Copies JWT as string to clipboard' do
        allow(STDIN).to receive_message_chain(:gets).and_return('')
        allow(STDOUT).to receive_message_chain(:puts).and_return(nil)
        subject.call
        expect(subject.token_string).to_not eq nil
        expect(Clipboard.paste).to_not eq nil
      end
    end
  end
end




