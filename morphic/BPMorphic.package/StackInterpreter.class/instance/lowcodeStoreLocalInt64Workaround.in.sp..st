inline primitive support
lowcodeStoreLocalInt64Workaround: baseOffset in: theFP sp: theSP 
	"This method is a workaround a GCC bug"
	"Fetch the value from the native tack"
	| _gsSqueakTemp_value _gsSqueakTemp_workNativeSP |
	_gsSqueakTemp_workNativeSP := self nativeStackPointerIn: theFP.
	_gsSqueakTemp_value := stackPages long64AtPointer: _gsSqueakTemp_workNativeSP - 1.
	self nativeStackPointerIn: theFP put: _gsSqueakTemp_workNativeSP + 8.
	"Store the local"
	self
		int64AtPointer: (self framePointerOfNativeLocal: baseOffset in: theFP)
		put: _gsSqueakTemp_value