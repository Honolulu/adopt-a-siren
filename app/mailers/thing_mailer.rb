class ThingMailer < ActionMailer::Base

  def send_personalized
    if ENV.include? 'FORCE_EMAIL' or ['2014-03-19', '2014-04-01', '2014-05-01', '2014-06-02', '2014-07-01', '2014-08-01', '2014-09-02', '2014-10-01', '2014-11-03', '2014-12-01', '2015-01-02', '2015-02-02', '2015-03-02', '2015-04-01', '2015-05-01', '2015-06-01', '2015-07-01', '2015-08-03', '2015-09-01', '2015-10-01', '2015-11-02', '2015-12-01'].include? Date.current.to_s
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
