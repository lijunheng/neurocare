require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have the content 'Duke Neurocare'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Duke Neurocare')
  	end
  	it "should have the title 'Duke Neurocare'" do
  		visit '/static_pages/events'
  		expect(page).to have_title('Duke Neurocare')
  	end
  end
  describe "Events page" do
  	it "should have the content 'Events'" do
  		visit '/static_pages/events'
  		expect(page).to have_content('Events')
  	end
  	it "should have the title 'Duke Neurocare | Events'" do
  		visit '/static_pages/events'
  		expect(page).to have_title('Duke Neurocare | Events')
  	end
  end
  describe "Wikispaces page" do
  	it "should have the content 'Wikispaces'" do
  		visit '/static_pages/wikispaces'
  		expect(page).to have_content('Wikispaces')
  	end
  	it "should have the title 'Duke Neurocare | Wikispaces'" do
  		visit '/static_pages/wikispaces'
  		expect(page).to have_title('Duke Neurocare | Wikispaces')
  	end
  end
  describe "Photos page" do
  	it "should have the content 'Photos'" do
  		visit '/static_pages/photos'
  		expect(page).to have_content('Photos')
  	end
  	it "should have the title 'Duke Neurocare | Photos'" do
  		visit '/static_pages/photos'
  		expect(page).to have_title('Duke Neurocare | Photos')
  	end
  end
  describe "Blog page" do
  	it "should have the content 'Blog'" do
  		visit '/static_pages/blog'
  		expect(page).to have_content('Blog')
  	end
  	it "should have the title 'Duke Neurocare | Blog'" do
  		visit '/static_pages/blog'
  		expect(page).to have_title('Duke Neurocare | Blog')
  	end
  end
  describe "Contact page" do
  	it "should have the content 'Contact'" do
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact')
  	end
  	it "should have the title 'Duke Neurocare | Contact'" do
  		visit '/static_pages/contact'
  		expect(page).to have_title('Duke Neurocare | Contact')
  	end
  end
end
