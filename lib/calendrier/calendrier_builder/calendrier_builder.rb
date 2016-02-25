module Calendrier
	module CalendrierBuilder
		class CustomBuilder < Builder

			def render(header, content)
				header = ['Mon', '21 May 2012',
				 'Tue', '22 May 2012',
				 'Wed', '23 May 2012',
				 'Thurs', '24 May 2012',
				 'Fri', '25 May 2012',
				 'Sat', '26 May 2012', 
				 'Sun', '27 May 2012']
			end
		end
	end
end