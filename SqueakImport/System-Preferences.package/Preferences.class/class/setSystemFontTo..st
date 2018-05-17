prefs - fonts
setSystemFontTo: aFont
	"Establish the default text font and style"

	| aStyle newDefaultStyle |
	aFont ifNil: [^ self].
	aStyle := aFont textStyle ifNil: [^ self].
	newDefaultStyle := aStyle copy.
	newDefaultStyle defaultFontIndex: (aStyle fontIndexOf: aFont).

	UserInterfaceTheme current
		set: #standardSystemFont to: aFont;
		apply.

	TextStyle setDefault: newDefaultStyle.
	Flaps replaceToolsFlap.
	ScriptingSystem resetStandardPartsBin.
	
