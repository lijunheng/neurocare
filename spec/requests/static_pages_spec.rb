require 'spec_helper'

describe "StaticPages" do
  subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end
  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Duke Neurocare' }
    let(:page_title) { '' }
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end
        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end
  describe "Events page" do
    before { visit events_path }
  	let(:heading) { 'Events' }
    let(:page_title) { 'Events' }
  end
  describe "Wikispaces page" do
    before { visit wikispaces_path }
  	let(:heading) { 'Wikispaces' }
    let(:page_title) { 'Wikispaces' }
  end
  describe "Photos page" do
    before { visit photos_path }
  	let(:heading) { 'Photos' }
    let(:page_title) { 'Photos' }
  end
  describe "Blog page" do
    before { visit blog_path }
  	let(:heading) { 'Blog' }
    let(:page_title) { 'Blog' }
  end
  describe "Contact page" do
    before { visit contact_path }
  	let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }
  end
  it "should have the right links on the layout" do
    visit root_path
    click_link "Home"
    expect(page).to have_title(full_title(''))
    click_link "Events", match: :first
    expect(page).to have_title(full_title('Events'))
    click_link "Photos"
    expect(page).to have_title(full_title('Photos'))
    click_link "Wikispaces"
    expect(page).to have_title(full_title('Wikispaces'))
    click_link "Blog", match: :first
    expect(page).to have_title(full_title('Blog'))
    click_link "Contact", match: :first
    expect(page).to have_title(full_title('Contact'))
  end
end
