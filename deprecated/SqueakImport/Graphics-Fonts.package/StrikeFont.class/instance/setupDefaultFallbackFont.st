emphasis
setupDefaultFallbackFont
	"This used to be the default textstyle, but it needs to be a StrikeFont and not a TTCFont and sometimes the default textstyle is a TTCFont.  So, we use a typical StrikeFont as the default fallback font."
	self fallbackFont: (StrikeFont defaultSized: self height).
	self reset.

