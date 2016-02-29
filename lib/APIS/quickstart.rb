require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'googleauth'
require 'google/api_client/client_secrets'

# @OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
@APPLICATION_NAME = 'Scholarship'
@CLIENT_SECRETS_PATH = 'client_secret.json'
@CREDENTIALS_PATH = File.join(Dir.home, '.credentials', "calendar-ruby-quickstart.yaml")
@SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials

def authorize(user)
  FileUtils.mkdir_p(File.dirname(@CREDENTIALS_PATH))
  client_secrets = Google::APIClient::ClientSecrets.load
  @@client_secrets = ENV['GOOGLE_CALENDAR_SECRET']

  @@client_id = Google::Auth::ClientId.from_file(@CLIENT_SECRETS_PATH)

  @@token_store = Google::Auth::Stores::FileTokenStore.new(file: @CREDENTIALS_PATH)

  @@authorizer = Google::Auth::UserAuthorizer.new(@@client_id, @SCOPE, @@token_store)

  user_id = user
  code = gets 
  credentials = authorizer.get_and_store_credentials_from_code(user_id: user_id, code: code, base_url: @OOB_URI)
  # credentials = @@authorizer.get_credentials(user_id)
  auth_client = client_secrets.to_authorization
end

# Initialize the API
@@service = Google::Apis::CalendarV3::CalendarService.new
@@service.client_options.application_name = 'Scholarship'
@@service.authorization = authorize('aspencerpsu@gmail.com')

@calendar_id = 'primary'
@response = service.list_events(calendar_id, max_results: 10, single_events: true, order_by: 'startTime', time_min: Time.now.iso8601)

puts "Upcoming events:"
puts "No upcoming events found" if response.items.empty?
response.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end

