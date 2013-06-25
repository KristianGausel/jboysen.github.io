#!/bin/bash

# create directory listing for notes

for DIR in $(find ./cs/noter -type d); do
  (
    echo "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "^index\.html$" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
    echo "</pre>\n<script type=\"text/javascript\">

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-25480624-1']);
_gaq.push(['_setDomainName', 'jboysen.dk']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

</script></body>\n</html>"
  ) > "${DIR}/index.html"
done