aws = require 'aws-sdk'
aws.config.httpOptions['timeout'] = 1000
aws.config.loadFromPath './auth.json'
ses = new aws.SES

to = ['yonashiro@std.it-college.ac.jp']
from = 'cloneko@gmail.com'
subject = '31days'

param = 
  Destination: 
    ToAddresses: to
  Message:
    Body:
      Text:
        Data: '更新した?'
        Charset: 'UTF-8'
    Subject: 
      Data: subject
      Charset: 'UTF-8'
  Source: from
  ReplyToAddresses: [from]

ses.sendEmail param, (error,data) ->
  if error
    console.log error
  else
    console.log data

