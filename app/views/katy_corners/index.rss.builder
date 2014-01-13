xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Katy's Corner at Player 1 Orlando"
    xml.description "A little peek at the gaming world from the eyes of Katy at Player 1 Orlando."
    xml.link posts_url

    for post in @katy_corners
      xml.item do
        xml.title post.title
        xml.description post.brief
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link katy_corner_url(post)
        xml.guid katy_corner_url(post)
      end
    end
  end
end
