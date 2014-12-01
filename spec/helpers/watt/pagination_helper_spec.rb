require 'rails_helper'

module Watt
  RSpec.describe PaginationHelper, type: :helper do
    describe '#build_paginator' do
      before(:each) do
        @per_page = 10
        @base_url = '/partner_artists?page=1'
      end
      context 'Single page of results' do
        (1..10).each do |i|
          before(:each) do
            @total_items_count = 10
            @items_count = i
            @current_page = 1
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':paginate should be false' do
            expect(@paginator[:paginate]).to be false
          end
          it ':current_page should be @current_page' do
            expect(@paginator[:current_page]).to be @current_page
          end
          it ':previous_url should be @base_url' do
            expect(@paginator[:previous_url]).to eq @base_url
          end
          it ':next_url should be @base_url' do
            expect(@paginator[:next_url]).to eq '/partner_artists?page=1'
          end
          it ':display_leading_ellipse should be false' do
            expect(@paginator[:display_leading_ellipse]).to be false
          end
          it ':display_trailing_ellipse should be false' do
            expect(@paginator[:display_trailing_ellipse]).to be false
          end
          it ':items_count should be @items_count' do
            expect(@paginator[:items_count]).to eq @items_count
          end
          it ':total_pages_count should be correct' do
            expect(@paginator[:total_pages_count]).to be (@total_items_count.to_f / @per_page.to_f).ceil
          end
        end
      end
      context '2-6 pages of results' do
        (1..6).each do |i|
          before(:each) do
            @total_items_count = 59
            @items_count = 10
            @current_page = i
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':paginate should be false' do
            expect(@paginator[:paginate]).to be true
          end
          it ':current_page should be @current_page' do
            expect(@paginator[:current_page]).to be @current_page
          end
          it ':previous_url should be @base_url' do
            expect(@paginator[:previous_url]).to eq @base_url if @current_page == 1
            expect(@paginator[:previous_url]).to eq "/partner_artists?page=#{@current_page - 1}" if @current_page > 1
          end
          it ':next_url should be @base_url' do
            expect(@paginator[:next_url]).to eq "/partner_artists?page=#{@current_page}" if @current_page == 6
            expect(@paginator[:next_url]).to eq "/partner_artists?page=#{@current_page + 1}" if @current_page < 6
          end
          it ':display_leading_ellipse should be false' do
            expect(@paginator[:display_leading_ellipse]).to be false
          end
          it ':display_trailing_ellipse should be false' do
            expect(@paginator[:display_trailing_ellipse]).to be false
          end
          it ':items_count should be @items_count' do
            expect(@paginator[:items_count]).to eq @items_count
          end
          it ':total_pages_count should be correct' do
            expect(@paginator[:total_pages_count]).to be (@total_items_count.to_f / @per_page.to_f).ceil
          end
        end
      end
      context 'More than 6 pages of results' do
        (1..8).each do |i|
          before(:each) do
            @total_items_count = 72
            @items_count = 10
            @current_page = i
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':paginate should be false' do
            expect(@paginator[:paginate]).to be true
          end
          it ':current_page should be @current_page' do
            expect(@paginator[:current_page]).to be @current_page
          end
          it ':previous_url should be @base_url' do
            expect(@paginator[:previous_url]).to eq @base_url if @current_page == 1
            expect(@paginator[:previous_url]).to eq "/partner_artists?page=#{@current_page - 1}" if @current_page > 1
          end
          it ':next_url should be @base_url' do
            expect(@paginator[:next_url]).to eq "/partner_artists?page=#{@current_page}" if @current_page == 8
            expect(@paginator[:next_url]).to eq "/partner_artists?page=#{@current_page + 1}" if @current_page < 8
          end
          it ':display_leading_ellipse should be correct' do
            if [5, 6, 7, 8].include? @current_page
              expect(@paginator[:display_leading_ellipse]).to be true
            else
              expect(@paginator[:display_leading_ellipse]).to be false
            end
          end
          it ':display_trailing_ellipse should be correct' do
            if [1, 2, 3, 4, 5].include? @current_page
              expect(@paginator[:display_trailing_ellipse]).to be true
            else
              expect(@paginator[:display_trailing_ellipse]).to be false
            end
          end
          it ':items_count should be @items_count' do
            expect(@paginator[:items_count]).to eq @items_count
          end
          it ':total_pages_count should be correct' do
            expect(@paginator[:total_pages_count]).to be (@total_items_count.to_f / @per_page.to_f).ceil
          end
        end
      end
      context ':page_groups' do
        context 'with one page' do
          before(:each) do
            @total_items_count = 10
            @items_count = @per_page
            @current_page = 1
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':page_groups should be correct' do
            expect(@paginator[:page_groups][:first].map { |x| x[:page] }).to eq [1]
            expect(@paginator[:page_groups][:second].map { |x| x[:page] }).to eq []
            expect(@paginator[:page_groups][:third].map { |x| x[:page] }).to eq []
          end
        end
        context 'on the first of six total pages' do
          before(:each) do
            @total_items_count = 60
            @items_count = @per_page
            @current_page = 1
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':page_groups should be correct' do
            expect(@paginator[:page_groups][:first].map { |x| x[:page] }).to eq [1, 2, 3, 4, 5, 6]
            expect(@paginator[:page_groups][:second].map { |x| x[:page] }).to eq []
            expect(@paginator[:page_groups][:third].map { |x| x[:page] }).to eq []
          end
        end
        context 'on the first of eight total pages' do
          before(:each) do
            @total_items_count = 80
            @items_count = @per_page
            @current_page = 1
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':page_groups should be correct' do
            expect(@paginator[:page_groups][:first].map { |x| x[:page] }).to eq [1, 2, 3, 4, 5]
            expect(@paginator[:page_groups][:second].map { |x| x[:page] }).to eq [8]
            expect(@paginator[:page_groups][:third].map { |x| x[:page] }).to eq []
          end
        end
        context 'somewhere in the middle of 12 total pages' do
          before(:each) do
            @total_items_count = 120
            @items_count = @per_page
            @current_page = 8
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':page_groups should be correct' do
            expect(@paginator[:page_groups][:first].map { |x| x[:page] }).to eq [1]
            expect(@paginator[:page_groups][:second].map { |x| x[:page] }).to eq [6, 7, 8, 9]
            expect(@paginator[:page_groups][:third].map { |x| x[:page] }).to eq [12]
          end
        end
        context 'on the last of eight total pages' do
          before(:each) do
            @total_items_count = 120
            @items_count = @per_page
            @current_page = 12
            @paginator = build_paginator(@total_items_count, @items_count, @per_page, @current_page, @base_url)
          end
          it ':page_groups should be correct' do
            expect(@paginator[:page_groups][:first].map { |x| x[:page] }).to eq [1]
            expect(@paginator[:page_groups][:second].map { |x| x[:page] }).to eq [8, 9, 10, 11, 12]
            expect(@paginator[:page_groups][:third].map { |x| x[:page] }).to eq []
          end
        end
      end
    end
  end
end
