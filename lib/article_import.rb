require 'libxml'

class ArticleImport

class << self
def import
    #site = Site.find 3
          Ambient.init
          Ambient.current_site = Site.find_by_id "3"
     debugger
          doc=LibXML::XML::Document.file("/home/ravishankar/Desktop/doc/Article_IA.xml")
          t=0
         doc.find("articles/article").each do |each_node|
        t=t+1
       art = Article.new
      xx=XmlMigratedData.find_by_model_type_and_ext_id_and_publication_id("Ia_Article_3",doc.find("#{each_node.path}").first['Id'],"#{Ambient.current_site.id}")

if !xx.blank?
           puts"--------------------------Article Present with Article Id #{xx.int_id}"
        else
article.title=doc.find("#{each_node.path}/title").first.content
        article.description=(doc.find("#{each_node.path}/summary").first.content) rescue ""
        puts"#{t}--------------------------------------#{article.title}"
        article.sub_title=(doc.find("#{each_node.path}/subheading").first.content) rescue ""
puts"-----------------Content Manupulation Start Here"




    end
    end
  end
 end
end

