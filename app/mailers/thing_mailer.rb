class ThingMailer < ActionMailer::Base

  def send_personalized
    if ENV.include? 'FORCE_EMAIL' or ['2013-01-02', '2013-02-01', '2013-03-01', '2013-04-01', '2013-05-01', '2013-06-03', '2013-07-01', '2013-08-01', '2013-09-03', '2013-10-01', '2013-11-01', '2013-12-02'].include? Date.current.to_s
      things = Thing.where(:thing_type => 1).joins(:users)
      
      things.each do |t|
        t.users.each do |u|
          emails = u.email
          print emails
          @thing_name = t.name
          @thingid = t.id
          @userid = u.id
          mail(:from => "dem@honolulu.gov", :to => emails, :subject => "Please remember to listen for your adopted siren today at 11:45AM").deliver
        end
      end      
    else
      print "skipping"
    end
    
  end

  def send_stream_signup (user)
    mail(:from => "stormwaterhonolulu@gmail.com", :to => user.email, :subject => "Thanks for adopting a stream!").deliver
  
  end
  
end
