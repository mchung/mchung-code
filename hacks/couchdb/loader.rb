require 'couchdb'
require 'query'
require 'rubygems'
require 'digest/sha1'


module DM
  class Loader
    attr_accessor :queries
    def initialize(filename)
      f = File.new(filename)
      @queries = []
      f.each do |line|
        a, b, c, d, e = line.split("\t")
        @queries << DM::Query.new(a, b, c, d, e)
      end
      @queries
    end
  end  
end

if $0 == __FILE__
  if ARGV[0]
    q = DM::Loader.new(ARGV[0])
  else
    q = DM::Loader.new("sample.data")
  end
  server = Couch::Server.new("localhost", "5984")
  q.queries.each do |qry| 
    sha1 = Digest::SHA1.hexdigest(qry.to_s + rand(100))
    server.put("/searchlogs/#{sha1}", qry.to_s)
  end
end
