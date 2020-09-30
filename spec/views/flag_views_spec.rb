require 'rails_helper'

RSpec.describe 'Flag Views', type: :system do
    describe 'pages have correct content' do
        it 'index page shows the right content' do
            visit flags_path
            expect(page).to have_content("FLAGS FLAGS FLAGS")
        end
    end
end