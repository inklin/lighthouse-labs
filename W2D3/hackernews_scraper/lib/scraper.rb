class Scraper
  class NotHackerNews < StandardError
  end

  attr_reader :post

  def initialize(url)
    @url = url
  end

  def doc
    html = open(@url)
    Nokogiri::HTML(html.read)
  end

  def run
    begin
      raise NotHackerNews unless @url.include?("news.ycombinator.com")
    rescue NotHackerNews
      puts "Boo, not a Hacker News site."
      exit(0)
    end
    create_parser(doc)
    create_post
    add_comments_to_post
    show_results
  end

  def show_results
    puts "Post title: #{@post.title}".colorize(:white).on_black
    puts "Number of comments: #{@post.comments.size}".colorize(:light_green).on_black
    puts "Number of points: #{@post.points}".colorize(:light_cyan).on_black
    puts "Post id: #{@post.id}".colorize(:light_yellow).on_black
    puts "URL: #{@post.url}".colorize(:light_red).on_black
  end

  private
  def create_parser(doc)
    @parser = Parser.new(doc)
  end

  def create_post
    @post = Post.new(@parser.title, @parser.url, @parser.points, @parser.id)
  end

  def add_comments_to_post
    @parser.parsed_comments.each do |comment|
      @post.add_comment(comment)
    end
  end
end