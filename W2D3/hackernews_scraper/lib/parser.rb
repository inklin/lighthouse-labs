class Parser
  attr_reader :doc
  class SectionNotFound < StandardError
  end

  class NoCommentsError < StandardError
  end

  def initialize(doc)
    @doc = doc
  end

  def id
    section = doc.search('span.score')
    raise SectionNotFound, "No ID section found" if section.nil?
    section[0]['id'][/\d+/].to_i
  end

  def title
    section = doc.search('.title > a')
    raise SectionNotFound, "No title found" if section.nil?
    section.text
  end

  def url
    section = doc.search('td.title > a')
    raise SectionNotFound, "No url section found" if section.nil?
    section[0]['href']
  end

  def points
    section = doc.search('span.score')
    raise SectionNotFound, "No points section found" if section.nil?
    section.text[/\d+/].to_i
  end

  def parsed_comments
    parsed_comments = []
    comments.each do |comment|
      parsed_comments << parsed_comment(comment)
    end
    parsed_comments
  end

  private

  def comments
    comments = doc.search('td.default')
    raise NoCommentsError "No comments found" if comments.nil?
    comments
  end

  def parsed_comment(comment)
    content = comment.search('span.comment > span')
    content = content.nil? ? "" : content.text
    user = comment.search('span.comhead > a:first-child')
    user = user.nil? ? "" : user.text
    id = comment.search('span.comhead > a:nth-child(2)')
    id = id.nil? ? "" : id[0]['href'][/\d+/].to_i
    Comment.new(user, id, content)
  end
end