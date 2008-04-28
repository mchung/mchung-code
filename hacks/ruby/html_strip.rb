str = <<HTML_TEXT
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
  <h1>Application error</h1>
  <p>Change this error message for exceptions thrown outside of an action (like 
in Dispatcher setups or broken Ruby code) in public/500.html</p>
  <a href="http://www.marcchung.com">Marc Chung</a>
  
</body>
</html>
HTML_TEXT
puts str.gsub(/<\/?[^>]*>/, "").strip
