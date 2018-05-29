midi dispatching
channelPressure: newPressure
	"Handle a channel pressure (channel aftertouch) change."

	self newVolume: newPressure.
