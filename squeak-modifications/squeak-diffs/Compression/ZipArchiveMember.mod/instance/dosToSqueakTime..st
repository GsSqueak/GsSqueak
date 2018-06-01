private
dosToSqueakTime: dt
	"DOS years start at 1980, so add 1980."
	| year mon mday hour min sec date time |

	year := (( dt bitShift: -25 ) bitAnd: 16r7F ).
	mon := (( dt bitShift: -21 ) bitAnd: 16r0F ).
	mday := (( dt bitShift: -16 ) bitAnd: 16r1F ).
	date := Date newDay: mday month: mon year: year+1980.

	hour := (( dt bitShift: -11 ) bitAnd: 16r1F ).
	min := (( dt bitShift: -5 ) bitAnd: 16r3F ).
	sec := (( dt bitShift: 1 ) bitAnd: 16r3E ).
	time := ((( hour * 60 ) + min ) * 60 ) + sec.

	^date asSeconds + time

	