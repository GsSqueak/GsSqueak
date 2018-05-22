html
closeHtmlOn: aHtmlReadWriter 

	self alignment = Centered ifTrue: [aHtmlReadWriter nextPutAll: '</center>'].
	({ Justified. LeftFlush. RightFlush. } includes: self alignment)
		ifTrue: [aHtmlReadWriter nextPutAll: '</div>'].
