path and pattern
pattern: textOrStringOrNil
	"Make sure the pattern source string is neither nil nor empty.
	We can strictly speaking handle arbitrary patterns to match against the filenames but in general we need to use suffices, so see #suffix: and #suffixList: "

	patternList := self parsePatternString: textOrStringOrNil