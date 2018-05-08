squeak protocol
asUnixTime
	"answer number of seconds since unix epoch (midnight Jan 1, 1970, UTC)"

	^(self - self class unixEpoch) asSeconds