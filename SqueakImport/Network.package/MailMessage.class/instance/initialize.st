initialize-release
initialize
	"initialize as an empty message"

	text := String cr.
	fields := Dictionary new.
	body := MIMEDocument contentType: 'text/plain' content: String cr.
	self dateTime: TimeStamp now.