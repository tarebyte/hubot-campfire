# Description:
#   Hubot delivers an emergency
#   compliment courtesy of http://http://emergencycompliment.com/
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot compliment me - Hubot gives a very nice compliment
#
# Author:
#   tarebyte

compliments = [
  'Your prom date still thinks about you all the time.',
  'All your friends worry they aren\u2019t as funny as you.',
  'Your boss loved that thing you did at work today.',
  'Your blog is the best blog.',
  'People at trivia night are terrified of you.'
]
module.exports = (robot) ->
  robot.hear /compliment me\b/i, (msg) ->
    
    rnd = Math.floor(Math.random()*compliments.length)
    msg.send compliments[rnd]
