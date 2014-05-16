ActionMailer::Base.delivery_method = :smtp
 
ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => 'gmail.com',
:user_name => 'exeusers@gmail.com',
:password => '0909121209',
:authentication => 'plain'
}