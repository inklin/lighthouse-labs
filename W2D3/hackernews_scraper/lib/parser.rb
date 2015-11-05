class Parser
  attr_reader :doc, :post

  def initialize(filename)
    @file = filename
    @post = nil
    @doc = nil
  end

  def run
    @doc = Nokogiri::HTML(File.open(@file))
    @post = create_post
    parse_comments
  end

  def create_post
    Post.new(post_title, post_url, post_points, post_id)
  end

  def post_id
    doc.search('span.score').attribute('id').value.gsub('score_', '')
  end

  def post_title
    doc.search('title').text.gsub(' | Hacker News', '')
  end

  def post_url
    "url"
  end

  def post_points
    doc.search('span.score').text.gsub(/[^\d]+/, '')
  end

  def parse_comments
    comments = doc.search('td.default')

    comments.each do |comment|
      new_comment = parsed_comment(comment)
      @post.add_comment(new_comment)
    end

    puts @post.inspect
  end

  def parsed_comment(comment)
    content = comment.search('span.comment > span').text.strip
    user = comment.search('span.comhead > a:first-child').attribute('href').value.gsub(/\w+\?id=([\w]+)/, '\1')
    id = comment.search('span.comhead > a:nth-child(2)').attribute('href').value.gsub(/[^\d]+/, '').to_i
    Comment.new(user, id, content)
  end
end