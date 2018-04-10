preferences
themeProperties
	| catName |
	catName := 'Other'.
	^ {{#hardShadowColor. catName. 'The color of shadows. An alpha about 0.5 is recommended.'}. {#hardShadowOffset. catName. 'The offset of the shadows behind the morph.'}. {#softShadowColor. catName. 'The color of soft shadows. An alpha less than 0.05 is recommended.'}. {#softShadowOffset. catName. 'The offset of soft shadows behind the morph.'}. {#keyboardFocusColor. catName. 'The color of the keyboard focus indication.'}. {#keyboardFocusWidth. catName. 'The width of the keyboard focus indication.'}}