class Parser

  def initialize(url)
    @url = url
  end

  def id
    doc.search('span.score')[0]['id'][/\d+/].to_i
  end

  def title
    doc.search('.title > a').text
  end

  def url
    doc.search('td.title > a')[0]['href']
  end

  def points
    doc.search('span.score').text[/\d+/].to_i
  end

  def parsed_comments
    parsed_comments = []
    comments.each do |comment|
      parsed_comments << parsed_comment(comment)
    end
    parsed_comments
  end

  private

  def doc
    html = open(@url)
    Nokogiri::HTML(html.read)
  end

  def comments
    doc.search('td.default')
  end

  def parsed_comment(comment)
    content = comment.search('span.comment > span').text
    user = comment.search('span.comhead > a:first-child').text
    id = comment.search('span.comhead > a:nth-child(2)')[0]['href'][/\d+/].to_i
    Comment.new(user, id, content)
  end
end