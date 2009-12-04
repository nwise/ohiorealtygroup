# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_content_managment_session',
  :secret      => '3a36cc2ffa9a6999b4ab4059d305281bea33968f68651b33df9e4bd17d69d104f497a92d5e8366f68ddcddadc160b6bb26da1bd040a4426c551ba5699e5a71a0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
