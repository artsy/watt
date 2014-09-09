require 'rails_helper'

module Watt
  RSpec.describe FlashHelper, type: :helper do
    describe "#flash_view_context" do
      it "returns flash-fullscreen if flash_name_str includes 'fullscreen'" do
        expect(flash_view_context('fullscreen_notice')).to eq "flash-fullscreen"
        expect(flash_view_context('fullscreen_error')).to eq "flash-fullscreen"
      end
      it "returns flash-async if flash_name_str includes 'async'" do
        expect(flash_view_context('async_notice')).to eq "flash-async"
        expect(flash_view_context('async_error')).to eq "flash-async"
      end
      it "returns flash-form by default" do
        expect(flash_view_context('bogusnotice')).to eq "flash-form"
      end
    end

    describe "#flash_type" do
      it "returns flash-error if flash_name_str includes 'error'" do
        expect(flash_type('async_notice')).to_not eq "flash-error"
        ['async_error', 'fullscreen_error', 'error'].each do |flash_name_str|
          expect(flash_type(flash_name_str)).to eq "flash-error"
        end
      end
      it "returns flash-notice by default" do
        expect(flash_type('bogusnotice')).to eq "flash-notice"
      end
    end
  end
end
