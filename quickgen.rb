#!/usr/bin/env ruby

require 'yaml'

def upcase_first(s)
  chars = s.chars
  chars.unshift(chars.shift.upcase).join
end

def cleanse(line)
  line.sub(/^\W+/, "")
end

ARGV.each do |file|
  lang = File.basename(file, ".html")
  doc = {
    "name" => upcase_first(lang),
    "resources" => []
  }

  lines = File.read(file).split("\n")
  labels = lines.grep(/label/).map {|l| cleanse(l)}
  win_opens = lines.grep(/window\.open/).map {|l| cleanse(l)}

  labels.zip(win_opens).each do |(l, w)|
    css_name, name = *l.scan(%r{label for=\"(.+)\"><b>(.+)</b></label><br>}).first
    js_url_expression = w.sub("window.open(", "").sub(");", "")

    doc["resources"] << {
      "name" => name,
      "css_name" => css_name,
      "js_url_expression" => js_url_expression
    }
  end

  ofile = "_data/languages/#{lang}.yaml"
  STDERR.puts "Creating #{ofile}"
  File.open(ofile, "w") {|f| f.print doc.to_yaml}
end
