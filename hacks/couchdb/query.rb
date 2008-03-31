module DM
  class Query
    attr_accessor :anon_id, :query, :query_time, :item_rank, :click_url
    def initialize(anonId, query, queryTime, itemRank, clickUrl)
      self.anon_id = anonId
      self.query = query
      self.query_time = queryTime
      self.item_rank = itemRank
      self.click_url = clickUrl.strip
    end
    
    def to_s
      str =<<XML
{"anon_id":"#{self.anon_id}", "query":"#{self.query}", "query_time":"#{self.query_time}", "item_rank":"#{self.item_rank}", "click_url":"#{self.click_url}"}
XML
    end
  end
end
