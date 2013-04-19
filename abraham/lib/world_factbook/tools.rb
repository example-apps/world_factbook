module WorldFactbook
  class Tools
    def run
      max_pop = doc.css("country").collect {|c| c['population'].to_i}.max
      doc.search("country[population='#{max_pop}']")

      inflation = doc.search('country').sort {|lt, gt| gt['inflation'].to_i <=> lt['inflation'].to_i }
      inflation.take(5).collect {|c| c['name'] + c['inflation']}
      hash = {}
      continents = doc.css('continent').map {|c| hash[c['name']] = []}
      doc.search('country').each {|c| hash[c['continent']] << c['name']}
    end
    def self.test
      42
    end
  end
end
