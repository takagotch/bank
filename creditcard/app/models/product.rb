def self.latest
  Product.order('updated_at desc').first
end

def index
  latest = Product.latest
  if stale?(etag: latest, last_modified: latest.updated_at.utc)
    #...
  end
end

