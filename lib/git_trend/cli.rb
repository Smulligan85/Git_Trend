class GitTrend::CLI

  def call
    greet_user
    set_lang
    display_projects
  end

  def greet_user
    puts "Welcome, lets see what's trending in your language."
  end

  def goodbye_user
    puts "Stay Trendy!"
  end

  def set_lang
    input = nil
    while input != "exit"
      puts "What language would you like to search?"
      input = gets.strip.downcase
      display_projects(input)
    end
    goodbye_user
    exit
  end

  def display_projects(lang)
    GitTrend::Scraper.get_page(lang)
  end
end
