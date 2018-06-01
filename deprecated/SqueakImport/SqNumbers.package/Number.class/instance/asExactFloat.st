converting
asExactFloat
	"Convert this number asFloat with a priori knowledge that it is an exact Float.
	Some subclass might exploit this knowledge for a faster implementation.
	Only send this if self isAnExactFloat."
	^self asFloat