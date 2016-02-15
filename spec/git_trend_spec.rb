require 'spec_helper'

describe GitTrend do
  it 'has a version number' do
    expect(GitTrend::VERSION).not_to be nil
  end

  context GitTrend::CLI do
    
    let(:cli){ GitTrend::CLI.new }

    describe "#greet_user" do
      it "welcomes the user to GitTrend upon call" do
        expect{cli.greet_user}.to output("Welcome, lets see what's trending in your language.\n").to_stdout
      end
    end
  end
end
