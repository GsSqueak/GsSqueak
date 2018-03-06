source mapping
sourceMap
	"Answer with a sorted set of associations (pc range)."
	^ sourceRanges associations
		replace: [:association | Association key: association key pc value: association value];
		 sort