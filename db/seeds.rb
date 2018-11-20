
Service.destroy_all
Quote.destroy_all
Enquiry.destroy_all
Accountant.destroy_all
User.destroy_all

services = ['Annual Accounts', 'Audit Services', 'Business Advice', 'Tax Services', 'M&A/Transaction', 'Bookkeeping', 'Other']
services.map! do |service|
  Service.create! name: service
end

u = User.create! name: "Paul", email: 'paul@abracadabra.com' company_size: '<1', company_name: 'Abracadabra Magicians Ltd', company_industry: 'Entertainment', company_location: 'London'
u2 = User.create! name: "James", email: 'james@slimline.org' company_size: '1-10', company_name: 'Slimline Fashion inc', company_industry: 'Retail', company_location: 'Oxford'
u3 = User.create! name: "Jennifer", email: 'jen@thedailyreporter.org' company_size: '10-25', company_name: 'The Daily Reporter', company_industry: 'Printing and Publishing', company_location: 'Reading'
u4 = User.create! name: "Steven", email: 'steven.s@btinternet.net' company_size: '<1', company_name: 'The Fox and Hounds', company_industry: 'Catering (Pubs, Restaurants, Food and Drink)', company_location: 'Exeter'

e = Enquiry.create! title: "Import/Export taxation", user: u, is_local: true, description: "My company imports and distributes a lot of equipment from China, looking for some help with taxes."
e2 = Enquiry.create! title: "General Bookkeeping", user: u2, is_local: false, description: "As my company has been growing I have been looking for someone to help keep the bookkeeping under control"
e3 = Enquiry.create! title: "Audit", user: u3, is_local: false, description: "Looking for an accountant to help out with audits."
e4 = Enquiy.create! title: "Financial difficulties", user: u4, is_local: true, description: "The pub is going through some hard times, we are looking for an accountant to help with insolvency."

es = EnquiryServices.create! service: services[3], enquiry: e
es2 = EnquiryServices.create! service: services[5], enquiry: e2
es3 = EnquiryServices.create! service: services[1], enquiry: e3
es4 = EnquiryServices.create! service: services[2], enquiry: e4

a = Accountant.create! name: 'Simmonds', email: 'enquiries@simmonds.org', phone_number: '020 733 9542', bio: 'Specialising in large businesses', location: "Manchester"
a2 = Accountant.create! name: 'Lewis Accountants inc', email: 'contact@lewisacct.com', phone_number: '01796 543 915', bio: 'Tax specialists', location: "Bristol"
a3 = Accountant.create! name: 'Smiths Ltd', email: 'new@smiths.biz', phone_number: '01759 582 535', bio: 'Insolvency experts', location: "Exeter"
a4 = Accountant.create! name: 'Harvey\'s accounting services', email: 'enquiries@harveys.co.uk', phone_number: '01258 413 092', bio: 'We focus on small import/export businesses', location: "London"

as = AccountantServices.create! accountant: a, service: service[0] # annual accounts
as2 = AccountantServices.create! accountant: a2, service: service[3] # tax
as3 = AccountantServices.create! accountant: a3, service: service[2] # business advice
as4 = AccountantServices.create! accountant: a4, service: service[3] # tax
as5 = AccountantServices.create! accountant: a, service: service[5] # bookkeeping
as6 = AccountantServices.create! accountant: a2, service: service[-1] # other
as7 = AccountantServices.create! accountant: a3, service: service[4] # M&A Transaction
as8 = AccountantServices.create! accountant: a4, service: service[0] # annual accounts

q = Quote.create! message: "Can you solve my problems?", successful: true, enquiry: e, accountant: a4
q2 = Quote.create! message: "Can you help me manage my books?", successful: false, enquiry: e2, accountant: a2
q3 = Quote.create! message: "Are you able to help with the company audits?", successful: true, enquiry: e3, accountant: a
q4 = Quote.create! message: "The pub is going through some hard times, are you able to help us out?", successful: false, enquiry: e4, accountant: a3
