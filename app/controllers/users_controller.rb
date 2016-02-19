
class UsersController < ApplicationController

  def login
    @client_id = "5fd7a0259588cf8549ce"
  end
  def logout
    session[:token] = nil
  end
  def oauth
    @client_id = "5fd7a0259588cf8549ce"
    @client_secret = "487efa6a07840cbd37ea2a3a5a78ef66990cf036"
    @code = params[:code]
    @token = HTTParty.post("https://github.com/login/oauth/access_token?client_id=#{@client_id}&client_secret=#{@client_secret}&code=#{@code}",
                           query = {
                             :headers => {
                               "Accept" => "application/json"
                             }
                           })
    session[:token] = @token["access_token"]
    if session[:token] == nil
      redirect_to user_login_path
    end
    @user = HTTParty.get("https://api.github.com/user?access_token=#{session[:token]}",
                         :headers=>{
      "User-Agent" => "GitStats"
    }
                        )
  end
  def repos
    if session[:token] == nil
      redirect_to user_login_path
    end
    @user = HTTParty.get("https://api.github.com/user?access_token=#{session[:token]}",
                         :headers=>{
                           "User-Agent" => "GitStats"
                         }
                        )
    @user_name = @user["login"]
    @repos =  HTTParty.get("https://api.github.com/user/repos?access_token=#{session[:token]}", 
                           :headers=>{
                             "User-Agent" => "GitStats"
                           }
                          )
  end
 def chart
    if session[:token] == nil
      redirect_to user_login_path
    end
   @user = HTTParty.get("https://api.github.com/user?access_token=#{session[:token]}",
                         :headers=>{
      "User-Agent" => "GitStats"
    }
                        )
   @user_name = @user["login"]
   @repos =  HTTParty.get("https://api.github.com/user/repos?access_token=#{session[:token]}", 
                           :headers=>{
                             "User-Agent" => "GitStats"
                           }
                          )
   @contributors = HTTParty.get("https://api.github.com/repos/#{params[:owner]}/#{params["repo_name"]}/stats/contributors?access_token#{session[:token]}",
                         :headers=>{
      "User-Agent" => "GitStats"
                         })
   @events =  HTTParty.get("https://api.github.com/repos/#{params[:owner]}/#{params["repo_name"]}/events?access_token=#{session[:token]}",
                         :headers=>{
      "User-Agent" => "GitStats"
                         })
   @total_merged = 0
   @all_contributors = []
   each_merged = []
   msg = @contributors["message"] rescue nil 
   msg_status = @contributors["status"] rescue nil 
   if msg == "Not Found"
     @error = "No Commits"
   elsif
     msg_status == "204 No Content" 
     @error = "No Commits"
   else 
     @contributors.each do |cont| 
       total_adc = {"a" => 0,"d" => 0, "c" => 0}
       each_contributor = {}
       each_add = []
       each_del = []
       each_com = []
       weeks = []
       cont["weeks"].each do |week|
         weeks.push(Time.at(week["w"]).strftime("%Y/%m/%d") +"~")
         total_adc["a"] += week["a"].to_i
         total_adc["d"] += week["d"].to_i
         total_adc["c"] += week["c"].to_i
         each_add.push(week["a"])
         each_del.push(week["d"])
         each_com.push(week["c"])
       end
       each_contributor.store("a", each_add)
       each_contributor.store("d",each_del)
       each_contributor.store("c",each_com)
       each_contributor.store("total_adc",total_adc)
       each_contributor.store("weeks",weeks) 
       each_contributor.store("contributor",cont["author"]["login"]) 
       @all_contributors.push(each_contributor)
     end
   end
   @events.each do |event|
     date =  event["payload"]["pull_request"]["merged_at"] rescue nil 
     unless date == nil 
       each_merged.push(event["actor"]["login"])
     end 
   end 
   @merged_pull = {}
   @all_contributors.each do |contributor|
   @merged_pull.store(contributor["contributor"],each_merged.count("#{contributor["contributor"]}"))
   end
 end
end
