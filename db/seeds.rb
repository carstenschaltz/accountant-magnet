# EnquiryService.destroy_all
# AccountantService.destroy_all
# Service.destroy_all
# Quote.destroy_all
# Enquiry.destroy_all
# Accountant.destroy_all
# User.destroy_all

# services = ['Annual Accounts', 'Audit Services', 'Business Advice', 'Tax Services', 'M&A/Transaction', 'Bookkeeping', 'Other']
# services.map! do |service|
#   Service.create! name: service
# end

u = User.create! name: "Paul", email: 'paul@abracadabra.com', password: 'password', company_size: '<1', company_name: 'Abracadabra Magicians Ltd', company_industry: 'Entertainment', company_location: 'London'
u2 = User.create! name: "James", email: 'james@slimline.org', password: 'password', company_size: '1-10', company_name: 'Slimline Fashion inc', company_industry: 'Retail', company_location: 'Oxford'
u3 = User.create! name: "Jennifer", email: 'jen@thedailyreporter.org', password: 'password', company_size: '10-25', company_name: 'The Daily Reporter', company_industry: 'Printing and Publishing', company_location: 'Reading'
u4 = User.create! name: "Steven", email: 'steven.s@btinternet.net', password: 'password', company_size: '<1', company_name: 'The Fox and Hounds', company_industry: 'Catering (Pubs, Restaurants, Food and Drink)', company_location: 'Exeter'
ua = User.create! name: "Admin", email: 'admin@admin.com', password: 'password', admin: true

e = Enquiry.create! title: "Import/Export taxation", user: u, email: 'paul@abracadabra.com', is_local: true, description: "My company imports and distributes a lot of equipment from China, looking for some help with taxes."
e2 = Enquiry.create! title: "General Bookkeeping", user: u2, email: 'james@slimline.org', is_local: false, description: "As my company has been growing I have been looking for someone to help keep the bookkeeping under control"
e3 = Enquiry.create! title: "Audit", user: u3, email: 'jen@thedailyreporter.org', is_local: false, description: "Looking for an accountant to help out with audits."
e4 = Enquiry.create! title: "Financial difficulties", email: 'steven.s@btinternet.net', user: u4, is_local: true, description: "The pub is going through some hard times, we are looking for an accountant to help with insolvency."
e5 = Enquiry.create! title: "Looking for a specalist in tax", user: u, email: 'paul@abracadabra.com', is_local: true, description: "My company is going international and I want a tax specalist."

es = EnquiryService.create! service: services[3], enquiry: e
es2 = EnquiryService.create! service: services[5], enquiry: e2
es3 = EnquiryService.create! service: services[1], enquiry: e3
es4 = EnquiryService.create! service: services[2], enquiry: e4

# old data
a = Accountant.create! name: 'Simmonds', email: 'enquiries@simmonds.org', phone_number: '020 733 9542', bio: 'Specialising in large businesses', location: "Manchester", website: 'www.accountant-directory.co.uk'
a2 = Accountant.create! name: 'Lewis Accountants inc', email: 'contact@lewisacct.com', phone_number: '01796 543 915', bio: 'Tax specialists', location: "Bristol", website: 'www.accountant-directory.co.uk'
a3 = Accountant.create! name: 'Smiths Ltd', email: 'new@ssmiths.biz', phone_number: '01759 582 535', bio: 'Insolvency experts', location: "Exeter", website: 'www.accountant-directory.co.uk'
a4 = Accountant.create! name: 'Harvey\'s accounting services', email: 'enquiries@harveys.co.uk', phone_number: '01258 413 092', bio: 'We focus on small import/export businesses', location: "London", website: 'www.accountant-directory.co.uk'

as = AccountantService.create! accountant: a, service: services[0] # annual accounts
as2 = AccountantService.create! accountant: a2, service: services[3] # tax
as3 = AccountantService.create! accountant: a3, service: services[2] # business advice
as4 = AccountantService.create! accountant: a4, service: services[3] # tax
as5 = AccountantService.create! accountant: a, service: services[5] # bookkeeping
as6 = AccountantService.create! accountant: a2, service: services[-1] # other
as7 = AccountantService.create! accountant: a3, service: services[4] # M&A Transaction
as8 = AccountantService.create! accountant: a4, service: services[0] # annual accounts
as8 = AccountantService.create! accountant: a, service: services[1]
as8 = AccountantService.create! accountant: a, service: services[2]
as8 = AccountantService.create! accountant: a, service: services[3]
as8 = AccountantService.create! accountant: a, service: services[4]
as8 = AccountantService.create! accountant: a, service: services[6]

q = Quote.create! message: "Can you solve my problems?", invite: true, successful: true, enquiry: e, accountant: a
q2 = Quote.create! message: "Can you help me manage my books?", invite: true, successful: false, enquiry: e2, accountant: a2
q3 = Quote.create! message: "I specialize in your industry, I can help you with your audits", invite: false, successful: true, enquiry: e3, accountant: a3
q4 = Quote.create! message: "I've helped numerous pubs like yours out of the financial difficulties your having. Happy to help here too!", invite: false, successful: false, enquiry: e4, accountant: a4
q5 = Quote.create! message: "£100/h for our tax expertise", invite: false, successful: false, enquiry: e, accountant: a

