class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :current_provider
  attr_accessor :student_activities, :education

  def current_user
  	@current_user ||= Student.find(session[:student_id]) if session[:student_id] 
  end

  def current_provider
    @current_provider ||= Provider.find(session[:provider_id]) if session[:provider_id]
  end
  
  def student_activities
  	@total_activities = {
  		"4-H" => 0,
  		"Quill Scroll" => 1,
  		"4-H Member Former" => 2,
  		"Accounting Club" => 3,
  		"AL Sheriff's Boys Girls Ranches" => 4,
  		"Alcohol Drug Awareness Programs Participant" => 5,
  		"Amateur Ham Radio" => 6,
  		"Art" => 7,
  		"Association for Int'l Practical Training" => 8,
  		"Auto Restoratin" => 9,
  		"Avid Program Participant(Dell Foundation)" => 9,
  		"Baseball Player/Participant(Youth-Current/Former)" => 10,
  		"Baseball Player/Participant(Youth-Current/Former" => 11,
  		"Baton Twirler" => 12,
  		"Beta Club Member" => 13,
  		"Bible Bowl Winner" => 14,
  		"Big Brothers & Sisters of America" => 15,
  		"Block Bridle Club Member" => 16,
  		"Boy Scouts of America" => 17,
  		"Boy Scouts/Eagle Scouts" => 18,
  		"Boy Scouts Explorer" => 19,
  		"Boy Club of America" => 20,
  		"Brain Bowl Participant" => 21, 
  		"Campus Diplomat -- University of College" => 22,
  		"Campus Involvement" => 23, 
  		"Carl A Spartz Award" => 24,
  		"Church Member" => 25,
  		"Circle k Member" => 26,
  		"Civil War Reenactment, Round Table, Related Areas" => 27,
  		"Class Officer" => 28,
  		"Club Officer" => 29,
  		"Numismatics" => 30,
  		"Community Service" => 31,
  		"Computers (Games, Reparis, Coding)" => 32,
  		"Crafts" => 33,
  		"Culinary Arts" => 34,
  		"Debate/Forensics Team Member" => 35,
  		"Destination ImaginNation" => 36,
  		"Duck Calling" => 37,
  		"Educational Talent Search Participant" => 38,
  		"Entrepreneur/Started Own Business" => 39,
  		"Euclidean Mathematics Club" => 40,
  		"Extracurricular Activities" => 41,
  		"Foreign Consulate/United Nations Member" => 42,
  		"Foreign Language Club" => 43,
  		"Forestry Club/Member" => 44,
  		"Games (Indoor/Outdoor)" => 45,
  		"General Youth Council" => 46,
  		"Girl Scout Odd Award" => 47,
  		"Girl Scouts" => 48,
  		"Goodwill Industries" => 49,
  		"Habitat for Humanity Program" => 50,
  		"Hearst Minority Scholar" => 51,
  		"Horse Shows" => 52,
  		"Horseshoe Pitching" => 53,
  		"Hunting" => 54,
  		"Icambio Program Participant" => 55,
  		"Interact" => 56,
  		"Jewish Student Union" => 57,
  		"Junior Achievement" => 58,
  		"Key Club" => 59, 
  		"Leadership Development Program" => 60,
  		"Learning For Life" => 61,
  		"Making It Count" => 62,
  		"Model United Nations" => 63,
  		"National Ocean Sciences Bowl Participant" => 64,
  		"Newspaper Editor, Staff(High School)" => 65,
  		"Non Smoker" => 66,
  		"Pageant Finalist" => 67,
  		"Pageant Winner" => 68,
  		"Photography" => 69,
  		"Pilot's License" => 70,
  		"Pom Pom Squad" => 71,
  		"Project Lead The Way" => 72,
  		"School-To-Career Initiative Program" => 73,
  		"Student Council President" => 74,
  		"Student Council Representive" => 75,
  		"Student Government Association" => 76,
  		"Students Against Drunk Driving" => 77,
  		"Synagogue Member" => 78,
  		"Upward Bound Program Participant" => 79,
  		"Volunteer Firefighter" => 80,
  		"Volunteer Hospital Participant" => 81,
  		"Washington Scholar" => 82,
  		"Wilderness Activities" => 83,
  		"Writing/Poetry" => 84,
  		"Yearbook Editor" => 85,
  		"Yearbook Staff" => 86,
  		"YMCA-YWCA" => 87,
  		"Youth Leadership Organization" => 88
  	}
  end

  def education 
  	@education = {
  		"Alternative High School" => 1,
  		"Associate's Degree (Received)" => 2,
  		"Catholic High School Student/Graduate" => 3,
  		"Community Junior College" => 4,
  		"Commuter Student" => 5,
  		"Continuing Education After Interrruption" => 6,
  		"Descendant of Alumni Of Same School" => 7,
  		"ESL - Enrolled In!" => 8,
  		"Evening School Student" => 9,
  		"Family, 2 or more at same college" => 10,
  		"GED Recipient" => 11,
  		"Honor Roll Student" => 12,
  		"Independent/Private College & University Attendee" => 13,
  		"International Baccalaurate Diploma, Received" => 14,
  		"Jesuit Baccalaurate Diploma, Received" => 15,
  		"Parochial High School Student" => 16,
  		"Part Time" => 17
  	}
  end

end
