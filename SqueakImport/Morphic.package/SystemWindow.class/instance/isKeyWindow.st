top window
isKeyWindow
	"The key window is the window with the user's main attention. It usually has a shadow or other visual hints to separate it from other windows. Usually, the key window is at the top of the screen. On large screens, however, many windows may appear at the top. Also see #beKeyWindow, #activate, and #lookFocused."

	^ self == self class keyWindow