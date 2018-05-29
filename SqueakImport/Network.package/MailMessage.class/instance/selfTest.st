testing
selfTest
	"For testing only: Check that this instance is well formed and makes sense"
	
	self formattedText.

	[MailAddressParser addressesIn: self from] ifError:
		[ :err :rcvr | Transcript show: 'Error parsing From: (', self from, ') ', err].
	[MailAddressParser addressesIn: self to] ifError:
		[ :err :rcvr | Transcript show: 'Error parsing To: (', self to, ') ', err].
	[MailAddressParser addressesIn: self cc] ifError:
		[ :err :rcvr | Transcript show: 'Error parsing CC: (', self cc, ') ', err].
