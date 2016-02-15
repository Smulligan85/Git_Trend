require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'

class GitTrend::Scraper
  
  def self.get_page(lang)
    doc = Nokogiri::HTML(open("https://github.com/trending/#{lang}"))
    projects = []
    doc.css(".repo-list-item").each do |project|
      title = project.css(".repo-list-name a").attribute("href").value.split("/")[-1].capitalize.green
      description = project.css(".repo-list-description").text || "No description given"
      projects << {title: title, description: description}
    end
    projects.each_with_index {|e, i| puts "#{i+1}. #{e[:title]} #{e[:description]}" }
    exit
  end

  
end
