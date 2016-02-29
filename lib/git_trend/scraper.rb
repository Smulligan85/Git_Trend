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
      description = project.css(".repo-list-description").text.strip
      readme = "https://github.com" + project.css(".repo-list-name a").attribute("href").value
      projects << {title: title, description: description, readme: readme}
    end
    projects
  end

  def self.get_readme(project)
    doc = Nokogiri::HTML(open("#{project}"))
    readme = doc.css("#readme").text.strip.sub("README.md", "")
    puts readme
  end

  
end
