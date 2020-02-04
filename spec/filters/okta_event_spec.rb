# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/okta_event"

describe LogStash::Filters::OktaEvent do
  describe "Set to Hello World" do
    let(:config) do <<-CONFIG
      filter {
        okta_event {
          message => "Hello World"
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject.get('message')).to eq('Hello World')
    end
  end
end
