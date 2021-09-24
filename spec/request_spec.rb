require 'request'

describe Request do

  context 'requests instantiated' do
    let(:instance) { Request.new(property_name: 'house', requester:'ed' ) }
    
    it 'init' do
      expect(instance.property_name).to eq 'house'
      expect(instance.requester).to eq 'ed'
    end

  end

end