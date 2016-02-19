require 'httparty'

class Github
@client_id = "904cc9594c8c07ccfa2f"
@client_secret = "00a7863631a3650af06ae8b901f89f7ec7d9f149"
  HTTParty.get("https://github.com/login/oauth/authorize",  :query => {
  :client_id => @client_id,
  }
              )
HTTParty.post("https://github.com/login/oauth/access_token", :query =>{
             :client_id => @client_id
             :client_secret => @client_secret
             :code => params[:code]
             #わからん
             )

end

