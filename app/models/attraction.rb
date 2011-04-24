class Attraction < ActiveResource::Base
  self.format = :json
  self.site = 'http://touringplans.com/:location'
end
