class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      i = Null 
      @@items.each do |it|
        if it.name.to_s = req.path.to_s[7...]
          resp.write(it.price)
        end 
      end 
    else 
      resp.write "Item not found"
      resp.status = 400
    end 
    else 
      resp.write "Route not found"
      resp.status = 404
    end 
    resp.finish
  end 
end 