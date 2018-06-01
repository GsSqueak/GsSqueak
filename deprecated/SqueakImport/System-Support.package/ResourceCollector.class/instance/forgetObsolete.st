initialize
forgetObsolete
	"Forget obsolete locators, e.g., those that haven't been referenced and not been stored on a file."
	locatorMap keys "copy" do:[:k|
		(locatorMap at: k) localFileName ifNil:[locatorMap removeKey: k]].