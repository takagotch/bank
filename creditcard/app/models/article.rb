# encoding: utf-8
class Article
  attr_reader :body

  def initialize(body)
    @body = body
  end

  def self.find_resent
    [ new("CurrentTime#{Time.now.to_S}"),
      new("text1"),
      new("text2"),
      new("text3") ]
  end
end



