as yet unclassified
initialize

	FromCharTable := Array new: 256.	"nils"
	ToCharTable := ($A to: $Z) , ($a to: $z) , ($0 to: $9) , '+/'.
	ToCharTable keysAndValuesDo: [:ind :char |
		FromCharTable at: char asciiValue + 1 put: ind - 1].