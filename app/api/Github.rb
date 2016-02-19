module Github
  class API < Grape::API
    prefix :api
    version 'v1'
    format :json
@client_id = "904cc9594c8c07ccfa2f"
@client_secret = "00a7863631a3650af06ae8b901f89f7ec7d9f149"
#あとで隠す
=begin
    resorurce :login  do
      desc "OAuth authorize"
      params do
        requires: :client_id type: String
      end

      get login/oauth/authorize do
        :code = params[:code]
        #codeの取り方がわからん
      end

      params do
        requires: :client_id type: String
        requires: :client_secret type: Strings
        requires: :code 
      end
      post login/oauth/access_token do
       :access_token = params[:access_token]
     end  
      get https://api.github.com/user?access_token= :access_token

    end
=end
    resource :repos do
      desc "show repos"
      get do
         @response = HTTParty.get("https://api.github.com/users/KentaYoshitani/repos", :query =>{
          :access_token =>"e0e79362f5667ba8a67d1e3f51b991cd2441646d"
                              })[0]

      end
      end
    end
    end
