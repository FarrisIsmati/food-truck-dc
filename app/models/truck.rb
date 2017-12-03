class Truck < ApplicationRecord
  belongs_to :company
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #Formats all truck markers for digestion by Google Maps
  def self.format_all_markers(trucks)
    hash = []
    lookUp = {}

    trucks.each do |truck|
      lat = truck.latitude
      lng = truck.longitude
      coordKey = "#{lat}#{lng}".to_sym

      data = {
        :lat => truck.latitude,
        :lng => truck.longitude,
        :name => Company.find(truck.company_id).name,
        :company => Company.find(truck.company_id).id,
        :truck => truck[:id]
      }

      if lookUp[coordKey]
        lookUp[coordKey] << data
      else
        lookUp[coordKey] = [data]
      end

      #Create info window setup
    end

    lookUp.each do |key, array|
      if array.length > 1
        companies = "<h1 class='infowindow-title'>Trucks</h1>"
        array.each do |truck|
          name = truck[:name]
          company = truck[:company]
          companies += "<a class='infowindow' href='/companies/#{company}'>#{name}</a>"
        end
        hash << {
          :lat => array[0][:lat],
          :lng => array[0][:lng],
          :infowindow => "<div class='flex-center-column'>#{companies}</div>"
        }
      else
        name = array[0][:name]
        company = array[0][:company]
        hash << {
          :lat => array[0][:lat],
          :lng => array[0][:lng],
          :infowindow => "<a class='infowindow' href='/companies/#{company}'>#{name}</a>"
        }
      end
    end

    return hash
  end

end
