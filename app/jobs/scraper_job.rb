# CAUTION: This writes to the DB. Likely next steps would be to change such that it writes to csv

require 'open-uri'

class ScraperJob < ApplicationJob
  queue_as :default

  def perform
    i = 1
    83.times do
      puts "Hacking in progress..."
      url = "https://www.accaglobal.com/uk/en/member/find-an-accountant/find-firm/results.html?isocountry=GB&location=&country=UK&firmname=%2B&organisationid=ACCA&hid=&pagenumber=#{i}&resultsperpage=200&requestcount=#{i}"
      puts "scraping page #{i}"
      html = open(url).read
      doc = Nokogiri::HTML(html)
      sleep rand(10..20)
      scrape(doc)
      i += 1
    end
  end

  def scrape(doc)
    doc.search('tbody tr').each do |row|
      accountant = Accountant.new
      name = row.search('.detailsLink')
      if row.attributes['id']
        set_name_email_phone_website(name, accountant, row)
      else
        accountant = Accountant.last
        set_expertise_certificates_sector(row, accountant)
      end
      accountant.save!
    end
  end

  def set_name_email_phone_website(name, accountant, row)
    name = name.text.strip
    accountant.name = name
    puts "making #{accountant.name}"
    contacts = row.search('li')
    contacts.each do |contact|
      t = contact.children.text.strip
      if t =~ /[^@]{1,}\@[^@.]{1,}\.[^@]{1,}/
        email = t
      elsif t =~ /\d+/
        phone = t
      else
        website = t
      end
      accountant.email = email if email
      accountant.phone_number = phone if phone
      accountant.website = website || nil if website
    end
    address = row.children[1].text.strip
    accountant.location = address.gsub(/\n/, ',').gsub(/\t/, '')
  end

  def set_expertise_certificates_sector(row, accountant)
    puts "setting #{accountant.name}'s services"
    row.search('h5').each_with_index do |header, index|
      n = header.next_element.text.strip
      if header.text.strip == 'Sector expertise'
        accountant.industries = n
      elsif header.text.strip == 'Services offered'
        a = n.split(", ")
        a.each do |b|
          b = 'Tax(CGT, Corporate, IHT, Personal and VAT)' if b == 'Tax(CGT'
          unless b == 'Corporate' || b == 'IHT' || b == 'Personal and VAT)'
            s = Service.find_or_create_by(name: b)
            puts s.name
            as = AccountantService.create!(accountant: accountant, service: s)
            puts "Accountant Service made"
          end
        end
      elsif header.text.strip == 'Certificates held'
        accountant.qualification = n.gsub(/\t/, '').gsub(/\n/, ',')
      end
    end
  end
end

# Run:
# rails c
# ScraperJob.perform_now
