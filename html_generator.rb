require 'json'
require 'open-uri'

class HtmlGenerator

  def index

    puts "HtmlGenerator: index"
    raw_response = open("http://lcboapi.com/products").read
    parsed_response = JSON.parse(raw_response)
    products = parsed_response[ "result"]

    products.each do |product|
      puts "<div class='product'>"
      puts "  <h2>#{product['name']}</h2>"
      puts "  <img src='#{product['image_thumb_url']}'  class='product-thumbnail'/>"
      puts "  <ul class='product-data'>"
      puts "    <li>id: #{product['id']}</li>"
      puts "    <li>#{product['producer_name']}</li>"
      puts "    <li>#{product['primary_category']}</li>"
      puts "    <li>#{product['secondary_category']}</li>"
      puts "    <li>#{product['volume_in_milliliters']} ml</li>"
     # puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
      puts "  </ul>"
      puts "</div>"
    end
  end

  def show(product_id=18)

    puts "HtmlGenerator: product #{product_id}"
    raw_response = open("http://lcboapi.com/products/#{product_id}").read
    parsed_response = JSON.parse(raw_response)
    product = parsed_response[ "result"]

    puts "<div class='product'>"
    puts "  <h2>#{product['name']}</h2>"
    puts "  <img src='#{product['image_url']}'  class='product-image'/>"
    puts "  <ul class='product-data'>"
    puts "    <li>id: #{product['id']}</li>"
    puts "    <li>#{product['producer_name']}</li>"
    puts "    <li>#{product['primary_category']}</li>"
    puts "    <li>#{product['secondary_category']}</li>"
    puts "    <li>#{product['origin']}</li>"
    puts "    <li>#{product['volume_in_milliliters']} ml</li>"
    puts "    <li>#{product['package']}</li>"
    # puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
    puts "    <li>#{product['serving_suggestion']}</li>"
    puts "    <li>#{product['tasting_note']}</li>"
    puts "    <li>Tags: #{product['tags']}</li>"
    puts "  </ul>"
    puts "</div>"

  end

end