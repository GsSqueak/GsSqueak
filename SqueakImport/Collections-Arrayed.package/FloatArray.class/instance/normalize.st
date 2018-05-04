arithmetic
normalize
	"Unsafely normalize the receiver in-place (become a unit vector).
 	 Div-by-Zero raised if len 0."
	
	self /= self length.