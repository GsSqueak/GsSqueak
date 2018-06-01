tests
testPort80
	"NetNameResolver testPort80"
	| infos |
	Transcript show: (infos := SocketAddressInformation
						forHost: 'localhost' service: '80' flags: 0
						addressFamily: 0 socketType: 0 protocol: 0) printString; cr.
	Transcript show: (infos := SocketAddressInformation
						forHost: '::1' service: '80' flags: 0
						addressFamily: 0 socketType: 0 protocol: 0) printString; cr.
