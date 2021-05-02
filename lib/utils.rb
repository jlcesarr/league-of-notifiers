OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Utils
 def self.req(httpmethod,url,headers = {},body)
    httpmethod.downcase!
    if body
        return HTTParty.method(httpmethod).call(url,:headers => headers, :body => body).body 
    end
    return HTTParty.method(httpmethod).call(url,:headers => headers).body
 end

  def self.is_number? string
    true if Float(string) rescue false
  end
end
