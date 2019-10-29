module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      puts "*******************"
      puts filtering_params #.reject(&:empty?).join(' ')
      puts "*******************"
      filtering_params.each do |key, value|
        puts "*******************"
        puts key
        puts value
        puts value.present?
        puts "*******************"
        #results = results.public_send(key, value) if value.present?
        results = results.name("duugi") if value.present?
      end
      results
    end
  end
end
