-Etoys-script-control
stopUp: dummy with: theButton 
	| _gsSqueakTemp_aPresenter |
	(_gsSqueakTemp_aPresenter := theButton presenter) flushPlayerListCache.
	"catch guys not in cache but who're running"
	_gsSqueakTemp_aPresenter stopRunningScriptsFrom: theButton