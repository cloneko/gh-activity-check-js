feed = require 'feed-read'
url = 'http://github.com/cloneko.atom'
feed.identify('atom')
process.env.TZ = 'Asia/Tokyo'

flag = false
feed url,(err,articles) ->
  throw err if err?
  date = new Date
  today = date.toString().substring(0,15)
  for article in articles 
    if article.title.match(/.*31day.*/)?
      if article.published.toString().substring(0,15) is today
        flag = true

  if flag is not true
    console.log 'not commited'


