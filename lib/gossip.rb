
class Gossip
attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  
    
  end

  #Sauvegarde un Gossip dans csv
  def save
    CSV.open("db/gossip.csv", "a+") do |csv|
    csv << [@author, @content]
  end 
  end

  #Affiche un array avec tous le csv
  def self.all
    all_gossips = []
  
    CSV.read("db/gossip.csv").each do |row|
      all_gossips << Gossip.new(row[0], row[1])
    end
    return all_gossips
  end

  #Affiche un gossip dans l'array
  def self.find(id)
    Gossip.all[id.to_i]
  end 

  

end



