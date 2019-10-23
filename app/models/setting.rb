# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1-DUUGI-" }

  DATE_FORMATS = [
   '%Y-%m-%d',
   '%d/%m/%Y',
   '%d.%m.%Y',
   '%d-%m-%Y',
   '%m/%d/%Y',
   '%d %b %Y',
   '%d %B %Y',
   '%b %d, %Y',
   '%B %d, %Y'
     ]

   TIME_FORMATS = [
     '%H:%M',
     '%I:%M %p'
     ]

  field :host, default: "http://example.com"
  field :readonly_item, type: :integer, default: 100, readonly: true
  field :user_limits, type: :integer, default: 20
  field :admin_emails, type: :array, default: %w[admin@duugi.net]
  # Override array separator, default: /[\n,]/ split with \n or comma.
  field :tips, type: :array, separator: /[\n]+/
  field :captcha_enable, type: :boolean, default: 1
  field :notification_options, type: :hash, default: {
    send_all: true,
    logging: true,
    sender_email: "foo@bar.com"
  }

  field :company_name, type: :string, default: "Example company"
  field :company_email, type: :string, default: ""
  field :company_phone, type: :string, default: ""
  field :currency_code, type: :string, default: "MNT"
  field :fiscal_year, type: :string, default: "Jan-Dec"
  field :language_code, type: :string, default: "mn"
  field :timezone, type: :string, default: ""
  field :date_format, type: :string, default: "yyyy-mm-dd"
  field :company_address, type: :hash, default: {
    number: "",
    building: "",
    street: "",
    suburb: "",
    city: "",
    state: "",
    country: "mn",
    zipcode: ""
  }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
