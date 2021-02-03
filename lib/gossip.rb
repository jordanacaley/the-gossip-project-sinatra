require 'bundler'
Bundler.require

class Gossip

  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << ["my super author", "my super content"]
    end
  end

end