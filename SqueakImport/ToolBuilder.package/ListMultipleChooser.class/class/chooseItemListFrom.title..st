ui requests
chooseItemListFrom: someObjects title: aString

	^ self new
		title: aString;
		labels: (someObjects collect: [:ea | ea asString]);
		values: someObjects;
		choose