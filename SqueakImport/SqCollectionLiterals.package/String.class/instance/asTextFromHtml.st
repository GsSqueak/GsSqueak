*SqCollectionLiterals-*SqCollectionLiterals-converting
asTextFromHtml
	"Answer a Text by interpreting the receiver as HTML."

	^ (HtmlReadWriter on: self readStream) nextText
