require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'date'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'.freeze
CLIENT_SECRETS_PATH = 'client_secret_dprfg.json'.freeze
CREDENTIALS_PATH = 'token.yaml'.freeze
###SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR


##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

calendar_id = 'primary'

now = DateTime.now.strftime(format='%FT%T%:z')

new_event =  Google::Apis::CalendarV3::Event.new({
  start: { date_time: DateTime.iso8601('2018-06-15T13:00:00-04:00').strftime(format='%FT%T%:z')},
  end: { date_time: DateTime.iso8601('2018-06-15T14:00:00-04:00').strftime(format='%FT%T%:z')},
  description: "meeting created #{now}",
  summary: 'this is the title',
  location: 'longworth A2345'
        })

response = service.insert_event(calendar_id, new_event)


# Fetch the next 10 events for the user

response = service.list_events(calendar_id,
                               max_results: 10,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)
puts 'Upcoming events:'
puts 'No upcoming events found' if response.items.empty?
response.items.each do |event|
  puts "- #{event.summary} - (#{event.start.date_time}), id = #{event.i_cal_uid}, #{event.html_link}"
end
