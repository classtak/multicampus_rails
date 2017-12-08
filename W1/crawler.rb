require 'httparty'
key = %w[2eAgHggWLAB5LfL6Nu8r3SG3Z4UH4iQKiXrJSZStnvkwmKy3xgohoZTZysSsRDZGLfKzxNdjb3gmDi0Hc2FyDQ%3D%3D
sfE57qPQ5x1eAXU41ftcyXYJZK5eKEONTGzz%2FdCe069VtqGX4UwcpLZbJhXSayA%2FtauuMhXPXttKeoxuafYWPQ%3D%3D
UL1xBxZaseZdirjzDd%2FpFeEwoqu%2F30xwbr1eP2LzPvmTi%2FqmROgmj%2FI7NDamVK%2FnSGwdaXiwDMzouathiU7eRQ%3D%3D
BINAQUF1MQJf6FXOWbG6W96gFNOapViNQRPD9xvA6kLNuMeswVQmgHX%2FPjcya0MnTnquManvOfS2Zle5h9rncA%3D%3D
mztvBXjsxa8%2F8IIg27Z63NnOunZXYTSEkpBsilqK0adtzznht0CSEbzeJL6ulhjiZRrc7J9QrU8y%2FHxhP3VzuQ%3D%3D
DDfELFJ5LFzaOx3FhFax5ml1KFXJ%2BN8%2Br2F7V4n473beoOQ4TK0HrDQY6NQ%2B3WumRNpxhDjl7gNL6iQleKZrbQ%3D%3D
9dJsyKFh7AJv2jA1qglU%2F0h96FqGWssJKz6hUQq3KHioEWOw8dPVOeyymd543BF9QW4l8DEcQIH%2FalcmfzgAzQ%3D%3D
YNOYgnqfckC4PbaLGyN7HiFwbGe8MPhRN%2FjqmMufa7uqAffIl7D5fO%2BSh8zbRnzYfgo%2B4%2Bife1oj187l2mejMg%3D%3D].sample
url = URI.encode("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=영등포구&dataTerm=MONTH&numOfRows=100&ServiceKey=")+key
# 1. url을 통해서 요청한다.
response = HTTParty.get(url)
dust = response['response']['body']['items']['item'][0]['pm10Value']
puts dust
