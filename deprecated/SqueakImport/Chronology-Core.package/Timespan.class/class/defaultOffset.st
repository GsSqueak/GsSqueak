configuring
defaultOffset
	"Timespans created in the context of an offset will start in that offset.  When no context is available, the defaultOffset for Timespans must be nil.  For example, two ways to make a Date for today:
	Date today.  'start is midnight without offset.  Will compare successfully to other Date today results.'
	DateAndTime now asDate.  'In this case, the start is midnight of the local time-zone.  It can only compare equally to Dates of its time-zone or Dates without timezone.'"
	^ nil