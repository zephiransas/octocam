require 'spec_helper'

describe Octocam::Parser do
  context 'parse_options' do
    before do
      allow(Octocam::Parser).to receive(:detect_owner_and_repository){ [ nil, nil ] }
    end

    subject{ Octocam::Parser.parse_options(arg) }

    context 'With valid args' do
      let(:arg){ %w(-o zephiransas -r octocam -f 2015-01-01 -t 2015-02-15) }
      it{ expect(subject[:owner]).to eq 'zephiransas' }
      it{ expect(subject[:repository]).to eq 'octocam' }
      it{ expect(subject[:from]).to eq Time.new(2015, 1, 1) }
      it{ expect(subject[:to]).to eq Time.new(2015, 2, 15) }
    end

    context 'Can parse nil and return nil' do
      let(:arg){ nil }
      it{ expect(subject[:owner]).to be_nil }
      it{ expect(subject[:repository]).to be_nil }
      it{ expect(subject[:from]).to be_nil }
      it{ expect(subject[:to]).to be_nil }
    end

    context 'Raise error with invalid Date' do
      let(:arg){ %w(-o zephiransas -r octocam -f 2015-01-01 -t hoge) }
      it{ expect{ Octocam::Parser.parse_options(arg) }.to raise_error(RuntimeError) }
    end

    context 'At git remote repository' do
      before do
        allow(Octocam::Parser).to receive(:detect_owner_and_repository){ [ 'zephiransas', 'octocam' ] }
      end
      let(:arg){ nil }
      it{ expect(subject[:owner]).to eq 'zephiransas' }
      it{ expect(subject[:repository]).to eq 'octocam' }
    end
  end
end
