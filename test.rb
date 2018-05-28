require 'watir'

def download(url)
  page = Watir::Browser.new(:chrome)
  # page.driver.manage.timeouts.implicit_wait = 300
  # page=  Watir::Browser.new(:phantomjs)
  page.goto(url)
  sleep(60)
  # page.screenshot.save "screenshot.png"
  # page.close()
  return  page
end

html = download('http://pekdev150.dev.fwmrm.net:3000')
# html = download('https://www.baidu.com')
# puts html.html
puts html.title
