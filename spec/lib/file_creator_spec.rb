require 'rails_helper'

RSpec.describe FileCreator do
  describe '.generate' do
    context 'when passed in line count > 1' do
      let!(:lines) { 3 }
      let!(:path)  { Rails.root.join('tmp', "file_#{lines}.txt") }

      # Cleanup temp file after test has run.
      after { File.delete(path) }

      it do
        # File is created first time the method is run for line count of 3.
        expect(described_class.generate(lines)).to be_truthy
        # Newly created file should contain 3 lines.
        expect(File.open(path, 'r').readlines.count).to eq(3)
        # Attempt to create the file again and don't overwrite.
        expect(described_class.generate(lines)).to be_falsey
      end
    end

    context 'when passed in line count < 1' do
      it { expect(described_class.generate(0)).to be_falsey }
    end
  end
end
