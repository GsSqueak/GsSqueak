file in/out
saveAs
	"Forget where stored before, and store.  Will ask user where."

	self forgetExistingURL.
	self storeOnServer.