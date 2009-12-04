Factory.define :page do |f|
  f.sequence(:title) { |n| n.to_s }
  f.content "foobar"
  f.keywords "foobar"
  f.published true
  f.sequence(:url_tag) { |n| n.to_s }
end
