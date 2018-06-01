private
flushCachedValues
	"Flush all values computed from ttcDescription and cached for speed"
	"TTCFont allInstancesDo:[:font| font flushCachedValues]"
	height := ascent := descent := nil.