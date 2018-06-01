system defaults
initWin32
	"HostFont initWin32"
	#(
			"Basic fonts"
			('Arial'				"menu/text serifless"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))
			('Times New Roman'	"menu/text serifs"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))
			('Courier New'			"menu/text fixed"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))
			('Wingdings'			"deco"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))
			('Symbol'				"deco"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			"Nice fonts"
			('Verdana'			"menu/text serifless"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			('Tahoma'			"menu/text serifless"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			('Garamond'			"menu/text serifs"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))
			('Georgia'			"menu/text serifs"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			('Comic Sans MS'	"eToy"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			"Optional fonts"
			('Impact'			"flaps"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			('Webdings'			"deco"
				(10 11 12 13 14 16 18 20 22 24 26 28 30 36 48 60 72 90))

			('System'		"12pt only"
				(12))
			('Fixedsys'		"12pt only"
				(12))
		) do:[:spec| HostFont textStyleFrom: spec first sizes: spec last].

	TextConstants removeKey: #Atlanta ifAbsent: [].
	TextConstants removeKey: #ComicPlain ifAbsent: [].
	TextConstants removeKey: #ComicBold ifAbsent: [].
	TextConstants removeKey: #Courier ifAbsent: [].
	TextConstants removeKey: #Palatino ifAbsent: [].

	TextConstants at: #DefaultFixedTextStyle put: (TextConstants at: #'Courier New').
	TextConstants at: #Helvetica put:  (TextConstants at: #'Arial').

