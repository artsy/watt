module Watt
  module PaginationHelper
    def build_paginator(total_items_count, items_count, per_page, current_page, base_url)
      # calculate the total number of pages
      total_pages_count = (total_items_count.to_f / per_page.to_f).ceil
      paginate = total_items_count > per_page
      uri = URI.parse(base_url)
      query_params = Rack::Utils.parse_query(uri.query)

      # build previous_url
      uri.query = current_page == 1 ? uri.query : query_params.merge!('page' => current_page - 1).to_query
      previous_url = uri.to_s

      # build next_url
      uri.query = current_page == total_pages_count ? query_params.merge!('page' => current_page).to_query : query_params.merge!('page' => current_page + 1).to_query
      next_url = uri.to_s

      # build pages array
      # 1(active) 2 3 4
      # 1 2(active) 3 4
      # 1 2 3(active) 4
      # 1 2 3 4(active)

      # 1(active) 2 3 4 5 6
      # 1 2(active) 3 4 5 6
      # 1 2 3(active) 4 5 6
      # 1 2 3 4(active) 5 6
      # 1 2 3 4 5(active) 6
      # 1 2 3 4 5 6(active)

      # 1(active) 2 3 4 5 .. 7
      # 1 2(active) 3 4 5 .. 7
      # 1 2 3(active) 4 5 .. 7
      # 1 2 3 4(active) 5 .. 7
      # 1 .. 3 4 5(active) 6 7
      # 1 .. 3 4 5 6(active) 7
      # 1 .. 3 4 5 6 7(active)

      # 1(active) 2 3 4 5 .. 8
      # 1 2(active) 3 4 5 .. 8
      # 1 2 3(active) 4 5 .. 8
      # 1 2 3 4(active) 5 .. 8
      # 1 .. 3 4 5(active) 6 .. 8
      # 1 .. 4 5 6(active) 7 8
      # 1 .. 4 5 6 7(active) 8
      # 1 .. 4 5 6 7 8(active)

      pages = []
      page_groups = { first: [], second: [], third: [] }
      page_numbers = []

      # if current_page is more than three away from the first page
      # display leading ellipse
      display_leading_ellipse = (current_page - 1) > 3 && total_pages_count > 6

      # if current_page is more than one away from the last page
      # display trailing ellipse
      display_trailing_ellipse = (total_pages_count - current_page) > 2 && total_pages_count > 6

      # always display first page
      page_numbers << 1

      if current_page == 1
        window_preceding_count = 0
        window_following_count = 4
      elsif current_page == 2
        window_preceding_count = 1
        window_following_count = 3
      elsif current_page == 3
        window_preceding_count = 2
        window_following_count = 2
      elsif current_page > 3 && (total_pages_count - current_page) > 2
        window_preceding_count = 2
        window_following_count = 1
      elsif current_page > 3 && (total_pages_count - current_page) == 2
        window_preceding_count = 2
        window_following_count = 1
      elsif current_page > 3 && (total_pages_count - current_page) == 1
        window_preceding_count = 3
        window_following_count = 0
      elsif current_page > 3 && (total_pages_count - current_page) == 0
        window_preceding_count = 4
        window_following_count = 0
      end

      # inner window should always be 4 pages with one page ahead and two pages behind
      window_preceding_count.downto(1) do |i|
        leading_page = current_page - i
        page_numbers << leading_page unless leading_page == 1 || leading_page < 1
      end

      # current page number
      page_numbers << current_page unless current_page == 1 || current_page == total_pages_count

      # following page(s)
      1.upto(window_following_count) do |i|
        following_page = current_page + i
        page_numbers << following_page unless following_page == 1 || following_page >= total_pages_count
      end

      # always display last page
      page_numbers << total_pages_count unless total_pages_count == 1

      page_numbers.each do |i|
        page_context = i
        uri.query = query_params.merge!('page' => page_context).to_query
        pages << { page: page_context, url: uri.to_s }
      end

      # build page groups
      pages.each do |page|
        if display_leading_ellipse && display_trailing_ellipse
          page_groups[:first] << page if page == pages.first
          page_groups[:second] << page unless [pages.first, pages.last].include? page
          page_groups[:third] << page if page == pages.last
        elsif display_leading_ellipse
          page_groups[:first] << page if page == pages.first
          page_groups[:second] << page if page != pages.first
        elsif display_trailing_ellipse
          page_groups[:first] << page if page != pages.last
          page_groups[:second] << page if page == pages.last
        else
          page_groups[:first] << page
        end
      end

      {
        total_pages_count: total_pages_count, paginate: paginate, current_page: current_page,
        previous_url: previous_url, next_url: next_url, pages: pages, items_count: items_count,
        display_leading_ellipse: display_leading_ellipse, display_trailing_ellipse: display_trailing_ellipse,
        page_groups: page_groups
      }
    end
  end
end
