require "erb"

class Page

  def initialize
  end

  def self.render t,path
    @title = t

    content = File.read(File.expand_path("header.html.erb"))
    t = ERB.new(content)
    header = t.result(binding)

    content = File.read(File.expand_path(path))
    t = ERB.new(content)
    main =  t.result(binding)

    content = File.read(File.expand_path("footer.html.erb"))
    t = ERB.new(content)
    footer = t.result(binding)
 
    outfile = File.expand_path(File.dirname(path) + "/" + File.basename(path, ".*"))
    puts outfile
  
    File.open(outfile, "w") do |f|
      f.write(header)
      f.write(main)
      f.write(footer)
    end

  end
end

Page.render("Mark Westcott", "index.html.erb")
Page.render("Data", "economics/data/index.html.erb")
Page.render("ArcGIS for Applied Economists", "economics/teaching/ss2015/ArcGIS/index.html.erb")
Page.render("R for Applied Economists", "economics/teaching/ss2015/R/index.html.erb")
Page.render("R for Applied Economists", "economics/teaching/ss2016/R/index.html.erb")
Page.render("R for Applied Economists", "economics/teaching/ws2015/R/index.html.erb")

