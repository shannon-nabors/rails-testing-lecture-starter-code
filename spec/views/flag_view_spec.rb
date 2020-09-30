require 'rails_helper'

RSpec.describe "Flag Views", type: :system do

    describe 'pages have correct content' do

        before(:all) do
            Flag.destroy_all
            Flag.create(region:"Zimbabwe", info:"The soapstone bird is a symbol of Zimbabwe.", image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_Zimbabwe.svg/255px-Flag_of_Zimbabwe.svg.png", rating:4)
        end

        it 'index page shows the right content' do
            visit flags_path
            expect(page).to have_content("FLAGS FLAGS FLAGS")
        end

        it 'index page lists all flags' do
            visit flags_path
            expect(page).to have_content("Zimbabwe")
        end
    end

    describe 'can create new flag with form' do

        before(:each) do
            ApplicationController.any_instance.stub(:logged_in?).and_return(true)
            User.stub(:find).and_return(User.new)
            User.any_instance.stub(:username).and_return("MATTEO")
        end

        it 'loads the new form' do
            visit new_flag_path
            expect(page).to have_content("Add a new flag")
        end

        it 'processes the flag form' do
            visit new_flag_path

            fill_in "flag[region]", with: "Qing dynasty (1889–1912)"
            fill_in "flag[info]", with: "Known as the Yellow Dragon Flag"
            fill_in "flag[image_url]", with: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Flag_of_China_%281889%E2%80%931912%29.svg/1024px-Flag_of_China_%281889%E2%80%931912%29.svg.png"
            choose "flag_current_false"
            select "4", from: "flag[rating]"
            select "Historical", from: "flag[flag_type]"
            click_on "Add flag"

            expect(page).to have_content("Type: Historical")
        end
    end

end