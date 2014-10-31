module ApplicationHelper
  
  def ugly_lyrics(lyrics)
    better_lyrics = ""
    lyrics.split(".").each do |line|
     better_lyrics << "<p> &#9835; #{h(line)}</p>"
    end
    better_lyrics.html_safe #only use .html_safe at end
  end
  
end
