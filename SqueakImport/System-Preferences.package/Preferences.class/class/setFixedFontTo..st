prefs - fonts
setFixedFontTo: aFont
	"Establish the default fixed text font and style"

	| aStyle newDefaultStyle |
	aFont ifNil: [^ self].
	aStyle := aFont textStyle ifNil: [^ self].
	
	newDefaultStyle := aStyle copy.
	newDefaultStyle defaultFontIndex: (aStyle fontIndexOf: aFont).

	UserInterfaceTheme current
		set: #standardFixedFont to: aFont;
		apply.

	TextStyle setDefaultFixed: newDefaultStyle.