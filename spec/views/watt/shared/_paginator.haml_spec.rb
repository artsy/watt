require 'rails_helper'
include Watt::PaginationHelper

describe "shared/watt/_paginator.haml", type: :view  do
  context 'single page of results' do
    before(:each) do
      allow(view).to receive_messages(total_items_count: 8)
      allow(view).to receive_messages(items_count: 8)
      allow(view).to receive_messages(per_page: 10)
      allow(view).to receive_messages(current_page: 1)
      allow(view).to receive_messages(base_url: '/partner_artists?sort=-created_at')
      render
    end
    it "does not display the .list-pager component" do
      expect(rendered).to_not have_selector('.list-pager')
    end
  end
  context 'multiple pages of results' do
    before(:each) do
      allow(view).to receive_messages(total_items_count: 72)
      allow(view).to receive_messages(items_count: 10)
      allow(view).to receive_messages(per_page: 10)
      allow(view).to receive_messages(current_page: 2)
      allow(view).to receive_messages(base_url: '/partner_artists?sort=-created_at')
      render
    end
    it "displays the .list-pager component" do
      expect(rendered).to have_selector('.list-pager')
    end
    it "displays the .list-pager-prev link" do
      expect(rendered).to have_selector(".list-pager-prev[href='/partner_artists?page=1&sort=-created_at']")
    end
    it "displays the .list-pager-next link" do
      expect(rendered).to have_selector(".list-pager-next[href='/partner_artists?page=3&sort=-created_at']")
    end
    it "displays the .list-pager-pages links" do
      expect(rendered).to have_css('.list-pager-pages', count: 2)
      expect(rendered).to have_selector(".list-pager-page-link[href='/partner_artists?page=1&sort=-created_at']")
      expect(rendered).to have_selector(".is-active[href='/partner_artists?page=2&sort=-created_at']")
      expect(rendered).to have_selector(".list-pager-page-link[href='/partner_artists?page=3&sort=-created_at']")
      expect(rendered).to have_selector(".list-pager-page-link[href='/partner_artists?page=4&sort=-created_at']")
      expect(rendered).to have_selector(".list-pager-page-link[href='/partner_artists?page=5&sort=-created_at']")
      expect(rendered).to_not have_selector(".list-pager-page-link[href='/partner_artists?page=6&sort=-created_at']")
      expect(rendered).to have_selector(".list-pager-page-link[href='/partner_artists?page=8&sort=-created_at']")
    end
  end
end
