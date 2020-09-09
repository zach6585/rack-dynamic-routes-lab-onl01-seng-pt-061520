class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      allo = req.params["q"]
      req.each do |par|
        resp.write "#{par}"
      end 
      resp.write "#{allo}"
      if @@items.include?(allo)
        resp.write "#{allo}"
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