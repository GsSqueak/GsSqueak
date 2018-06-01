instance creation
new
	"For this class we override Stream class>>new since this
	class actually is created using #new, even though it is a Stream."
	
	^self new: 10