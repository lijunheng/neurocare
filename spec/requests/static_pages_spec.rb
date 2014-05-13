require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Home page" do
    before { visit root_path }
    it { should have_content('Duke Neurocare') }
    it { should have_title(full_title('')) }
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
  	it { should have_content('Events') }
    it { should have_title(full_title('Events')) }
  end
  describe "Wikispaces page" do
    before { visit wikispaces_path }
  	it { should have_content('Wikispaces') }
    it { should have_title(full_title('Wikispaces')) }
  end
  describe "Photos page" do
    before { visit photos_path }
  	it { should have_content('Photos') }
    it { should have_title(full_title('Photos')) }
  end
  describe "Blog page" do
    before { visit blog_path }
  	it { should have_content('Blog') }
    it { should have_title(full_title('Blog')) }
  end
  describe "Contact page" do
    before { visit contact_path }
  	it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end
