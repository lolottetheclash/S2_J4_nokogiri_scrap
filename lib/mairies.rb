require 'open_uri_redirections'
require 'nokogiri'



$page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))  

def nom_mairie
# stocke les noms de mairie dans l'array array_mairie
	array_mairie = []
	$page.css('a.lientxt').each do |nom|
	nom = nom.text
	array_mairie.push(nom)
	end
return array_mairie
end



def mairies
	
# stocke les liens des mairies dans l'array array_final
	array_final = []
	array_liens = $page.xpath('//a')
	array_mail = []
	array_liens.each do |array_lien|
		#puts array_lien['href']
		if array_lien['class'] == "lientxt"
	  	 	nom = array_lien['href']
	  	 	nom = nom[1..nom.length]
	   	 	page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{nom}"))
			
			page2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
				mail = mail.text 
				array_mail.push(mail)
			end
		end
	end
	return la_totale = nom_mairie.zip(array_mail).to_h
end

puts mairies