accessing
date

	^ DateAndTime fromSeconds: self time + (Date newDay: 1 year: 1980) asSeconds