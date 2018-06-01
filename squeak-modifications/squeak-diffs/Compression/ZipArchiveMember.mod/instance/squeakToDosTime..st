private
squeakToDosTime: secs
	| dosTime dateTime |

	dateTime := Time dateAndTimeFromSeconds: secs.
	dosTime := (dateTime second seconds) bitShift: -1.
	dosTime := dosTime + ((dateTime second minutes) bitShift: 5).
	dosTime := dosTime + ((dateTime second hours) bitShift: 11).
	dosTime := dosTime + ((dateTime first dayOfMonth) bitShift: 16).
	dosTime := dosTime + ((dateTime first monthIndex) bitShift: 21).
	dosTime := dosTime + (((dateTime first year) - 1980) bitShift: 25).
	^dosTime
