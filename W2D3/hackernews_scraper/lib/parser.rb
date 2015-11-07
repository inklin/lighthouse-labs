class Parser
  attr_reader :doc
  class SectionNotFound < StandardError
  end

  class NoCommentsError < StandardError
  end

  class CommentParsingError < StandardError
  end

  def initialize(doc)
    @doc = doc
  end

  def id
    section = doc.search('span.score')
    raise SectionNotFound, "No ID section found" unless section
    section[0]['id'][/\d+/].to_i
  end

  def title
    section = doc.search('.title > a')
    raise SectionNotFound, "No title found" unless section
    section.text
  end

  def url
    section = doc.search('td.title > a')
    raise SectionNotFound, "No url section found" unless section
    section[0]['href']
  end

  def points
    section = doc.search('span.score')
    raise SectionNotFound, "No points section found" unless section
    section.text[/\d+/].to_i
  end

  def parsed_comments
    comments = comments.map { parsed_comment(comment) }
  end

  private

  def comments
    comments = doc.search('td.default')
    raise NoCommentsError "No comments found" unless comments
    comments
  end

  def parsed_comment(comment)
    content = comment.search('span.comment > span')
    raise CommentParsingError unless content
    content = content.text
    user = comment.search('span.comhead > a:first-child')
    raise CommentParsingError unless user
    user = user.text
    id = comment.search('span.comhead > a:nth-child(2)')
    raise CommentParsingError unless id
    id = id[0]['href'][/\d+/].to_i

    Comment.new(user, id, content)
  end
end