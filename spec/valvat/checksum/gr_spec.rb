require 'spec_helper'

describe Valvat::Checksum::GR do
  %w(EL123456783 EL094543092 EL998219694).each do |valid_vat|
    it "returns true on valid vat #{valid_vat}" do
      Valvat::Checksum.validate(valid_vat).should eql(true)
    end

    invalid_vat = "#{valid_vat[0..-3]}#{valid_vat[-1]}#{valid_vat[-2]}"

    it "returns false on invalid vat #{invalid_vat} #{valid_vat}" do
      Valvat::Checksum.validate(invalid_vat).should eql(false)
    end
  end
end