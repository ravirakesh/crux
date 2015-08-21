require 'nokogiri'
require 'builder'


class XmlCat

def self.cat
#debugger
a = Time.now
file = File.open("#{Rails.root}/log/cat_.xml", "w")



build = Nokogiri::XML::Builder.new  do  |xml|
#xml.instruct! :xml, :version => "1.0"
xml.body do 
   xml.node1 "some string"
   xml.node2 123
  xml.node3 do 
    xml.node3_1 "another string"
    end
 xml.node4 "with attributes", :attribute => "some attribute"
xml.selfclosing
end
end


=begin
xml.data do
  xml.config do
    xml.columns do
      xml.column "id" => "name", "title" => item('name')
     # xml.column "id" => "address", "title" => item('address')
      #xml.column "id" => "phone", "title" => ('phone')
      #xml.column "id" => "email", "title" => ('email')
    end
  end
  @clients.each do |client|
    xml.item "id" => client.id, "name" => client.name, "address" => client.address, "phone" => client.phone, "email" => client.email
  end
end
}.to_xml


file.puts "#{build}"


doc = Nokogiri::XML(file)
doc.at_xpath("/*/@id")
root = doc.root
root["id"]
root.at_xpath("@id")
root.at_xpath("Name")
items = root.xpath("Items/Item")
items.count
items[0]["filename"]
items[0].at_xpath("Title")
doc.xpath("//keywords")

#file.close

=end


#file.puts "#{build}"

file.write(build.to_xml)


file.close
puts (Time.now-a).to_s

end
end

