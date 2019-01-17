require 'open_uri_redirections'
require 'nokogiri'



page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))  



def crypto

	begin

	array_nom = []
	page.css('td.text-left.col-symbol').each do |nom|
	nom = nom.text
	array_nom.push(nom)
	end

	array_prix = []
	page.css('a.price').each do |prix|
	prix = prix.text
	array_prix.push(prix)
	end

rescue => e 
	  puts "Oups petite erreur, mais c'est pas grave" 

	end
end


puts myhash = array_nom.zip(array_prix).to_h

