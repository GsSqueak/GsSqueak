ui requests
chooseIndexListFrom: someObjects title: aString

	^ self new
		title: aString;
		labels: (someObjects collect: [:ea | ea asString]);
		choose