class GitTrend::CLI

  def call
    greet_user
    set_lang
  end

  def greet_user
    puts "Welcome, lets see what's trending in your language."
  end

  def goodbye_user
    puts "Stay Trendy!"
    exit
  end

  def request_info
    puts "Would you like to see a README of a trending project?"
    input = gets.strip.downcase
    if input == "yes"
      true
    else
      false
    end
  end

  def display_readme(lang)
    puts "Choose number for project"
    input = gets.strip.to_i - 1
    project = GitTrend::Scraper.get_page(lang)
    readme = project[input][:readme]
    GitTrend::Scraper.get_readme(readme)
  end

  def set_lang
    puts "What language would you like to search?"
    input = gets.strip.downcase
    while input != "exit"
      display_projects(input)
      if request_info
        display_readme(input)
      else
        set_lang
      end
    end
    goodbye_user
  end

  def display_projects(lang)
    projects = GitTrend::Scraper.get_page(lang)
    projects.each_with_index {|e, i| puts "#{i+1}. #{e[:title]} -- #{e[:description]}" }
  end
end
