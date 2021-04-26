require "httparty"
require "openssl"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Utils
 def self.req(httpmethod,url,headers = {},body)
    httpmethod.downcase!
    if body
        return HTTParty.method(httpmethod).call(url,:headers => headers, :body => body).body
    end
    return HTTParty.method(httpmethod).call(url,:headers => headers).body
 end

 def self.getStr(string,init,ends,index)
    begin
        stri = string.split(init)
        stri = stri[index].split(ends)
        return stri[0]
    rescue
        return "PARSE ERROR"
    end
 end

 def self.delay_call(seconds)
    last_tick = Time.now
    loop do
      sleep 0.1
      if Time.now - last_tick >= seconds
        last_tick += seconds
        yield
      end
    end
 end

  def self.is_number? string
    true if Float(string) rescue false
  end

  def self.twocaptcha(twocaptcha_key,page_url,google_key)
        resolveID = JSON.parse(self.req("GET","https://2captcha.com/in.php?key=#{twocaptcha_key}&method=userrecaptcha&json=1&googlekey=#{google_key}&pageurl=#{page_url}",false,false))["request"]
        if self.is_number? resolveID
          while true
            solvedCaptcha = JSON.parse(self.req("GET","https://2captcha.com/res.php?key=#{twocaptcha_key}&json=1&action=get&id=#{resolveID}",false,false))["request"]
            if solvedCaptcha.length >= 25
              return solvedCaptcha
            end
          end
        end
        return resolveID
  end
end
