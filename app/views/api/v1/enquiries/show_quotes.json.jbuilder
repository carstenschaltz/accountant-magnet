json.extract! @enquiry, :id, :title
json.quotes @enquiry.quotes do |quote|
  json.extract! quote, :id, :successful, :message, :invite, :accountant, :enquiry_id
end
