#
# ---------
# URL Steps
# ---------
# step "access :url" do |url|
#   visit url
# end
#
# Defining a step alias:
# step "access homepage" do
#   step "access /"
# end
#
# -----------
# Login steps
# -----------
# step "login with :email and :password" do |email, password|
#   click_link 'link_login'
#
#   within('#login') do
#       fill_in 'user', :with => email
#       fill_in 'password', :with => password
#   end
#
#   find('#submit').click
#   sleep 10 # wait for redirects...
# end
#
# step "i'm logged in" do
#   step "access homepage"
#   step "login with username@domain.com p4ssw0rd"
# end
#
# --------------
# CSS assertions
# --------------
# step "element :selector should exist" do |selector|
#   page.should have_selector(selector)
# end
#
# step "elemento :selector shouldn't exist" do |selector|
#   page.should_not have_selector(selector)
# end
#
# -----------
# Utilities
# -----------
# step "wait for ajax" do
#   Timeout.timeout(Capybara.default_wait_time) do
#     loop do
#       active = page.evaluate_script('jQuery.active')
#       break if active == 0
#     end
#   end
# end
#
