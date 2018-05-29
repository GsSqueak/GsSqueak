housekeeping
cleanOutUndeclared 
	"This should be deprecated, and senders rewritten to deal with environments directly"
	self flag: #environments.
	
	globals purgeUndeclared.
