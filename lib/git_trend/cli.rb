class GitTrend::CLI

  def call
    greet_user
    set_lang
  end

  def greet_user
    puts "Welcome, lets see what's trending in your language."
  end

  def set_lang
    input = nil
    while input != "exit"
      puts "What language would you like to search?"
      input = gets.strip.downcase
      input
    end
  end
end
