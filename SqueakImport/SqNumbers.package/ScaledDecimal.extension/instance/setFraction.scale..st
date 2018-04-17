*SqNumbers-private
setFraction: fractionIn scale: scaleIn 
	"Private - Set the fraction to fractionIn and the total number of digits 
	used to represent the fraction part of the receiver, including trailing 
	zeroes, to the Integer scaleIn."
	fraction := fractionIn.
	scale := scaleIn
