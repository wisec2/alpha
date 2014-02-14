module HomeHelper
  
  # API Key
  def google_maps_api_key
    "AIzaSyB08FgYUUc1fpgM2qpnZH2ciGE_gR3LiUI"
  end

  # Google API URL
  def google_api_url
    "http://maps.googleapis.com/maps/api/js"
  end

  def google_api_access
    "#{google_api_url}?key=#{google_maps_api_key}&sensor=false"
  end

  def google_maps_api
    puts "hellur"
    content_tag(:script, :type => "text/javascript", :src => google_api_access) do
    end
  end 

end
