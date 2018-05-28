
# frozen_string_literal: true

require 'net/smtp'
require 'mail'
require 'pony'
require './config'


require 'watir'
# require 'watir-webdriver'

class MailReporter
  
  def download(url)
    page = Watir::Browser.new(:chrome) 
    
    # page=  Watir::Browser.new(:phantomjs)
    
    page.goto(url)
    sleep(10)
    
    # page.close()
    return  page
  end


  def true_body
    page = download('http://pekdev150.dev.fwmrm.net:3000')
    # puts page.html
    page.html
    # page.div(:class=>"ant-layout-content").html
  end

  def true_html
    main_body = '
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
      </head>
      <body>
      <br/>
      <div class="container bg-white">
      <img src="https://s1.ax1x.com/2018/05/28/C4Dz6O.png" alt="C4Dz6O.png" style="width:auto;height:auto;max-width:100%;max-height:100%;">
      <center><a href="http://pekdev150.dev.fwmrm.net:3000/#/">View More Details</a></center>
      <br/>
      </div>
      </body>
      </html>'
    return main_body
  end

  def report
    Pony.mail(
      from: Config.instance.mail_from,
      to: Config.instance.mail_to,
      cc: Config.instance.mail_cc,
      subject: 'UI Monitor Group Daily Report Test2',
      via: :sendmail,
      html_body: true_html
      )
  end
end

mr = MailReporter.new
mr.report
