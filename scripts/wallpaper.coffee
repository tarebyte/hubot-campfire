# Description:
#   Hubot delivers a pic from Reddit's /r/wallpaper frontpage
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   wallpaper - Display the picture from /r/wallpaper
#
# Author:
#   tarebyte

module.exports = (robot) ->
  robot.respond /wallpaper/i, (msg) ->
    search = escape(msg.match[1])
    msg.http('http://www.reddit.com/r/wallpapers.json')
      .get() (err, res, body) ->
        result = JSON.parse(body)

        if result.data.children.count <= 0
          msd.send "I can't find any wallpapers"
          return
        
        urls = [ ]
        for child in result.data.children
          urls.push(child.data.url)

        rnd = Math.floor(Math.random()*urls.length)
        msg.send urls[rnd]
