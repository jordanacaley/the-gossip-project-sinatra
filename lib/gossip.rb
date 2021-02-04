require 'bundler'
Bundler.require

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def self.update(id, author, content)
    rows_array = CSV.read('./db/gossip.csv')

    desired_indices = [id - 1].sort # rows to modify
    rows_array.each.with_index(desired_indices[0]) do |row, index| 
      if desired_indices.include?(index)

        # modify content
        rows_array[index][0] = author
        rows_array[index][1] = content

      end
    end

    # update CSV file
    CSV.open('./db/gossip.csv', 'wb') { |csv| rows_array.each{|row| csv << row}}
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    table = CSV.read("./db/gossip.csv")
    return table[id - 1]
  end

end