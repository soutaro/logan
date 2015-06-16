require 'logan/HashConstructed'
require 'logan/response_handler'

module Logan
  class Group
    include HashConstructed

    attr_accessor :id
    attr_accessor :name
    attr_accessor :created_at
    attr_accessor :updated_at

    def to_hash
      { :id => @id, :type => "Group" }
    end

    def memberships
      response = Logan::Client.get "/groups/#{@id}.json"
      response.parsed_response["memberships"].map {|h| Logan::Person.new(h) }
    end
  end
end
