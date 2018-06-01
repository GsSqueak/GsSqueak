accessing
rangesForJapanese

	| basics etc |
	basics := {
		Array with: 0 with: 255
	}.
	etc := {
		Array with: 16r370 with: 16r3FF. "greek"
		Array with: 16r400 with: 16r52F. "cyrillic"
		Array with: 16r1D00 with: 16r1D7F. "phonetic"
		Array with: 16r1E00 with: 16r1EFF. "latin extended additional"
		Array with: 16r2000 with: 16r206F. "general punctuation"
		Array with: 16r20A0 with: 16r20CF. "currency symbols"
		Array with: 16r2100 with: 16r214F. "letterlike"
		Array with: 16r2150 with: 16r218F. "number form"
		Array with: 16r2190 with: 16r21FF. "arrows"
		Array with: 16r2200 with: 16r22FF. "math operators"
		Array with: 16r2300 with: 16r23FF. "misc tech"
		Array with: 16r2460 with: 16r24FF. "enclosed alnum"
		Array with: 16r2500 with: 16r257F. "box drawing"
		Array with: 16r2580 with: 16r259F. "box elem"
		Array with: 16r25A0 with: 16r25FF. "geometric shapes"
		Array with: 16r2600 with: 16r26FF. "misc symbols"
		Array with: 16r2700 with: 16r27BF. "dingbats"
		Array with: 16r27C0 with: 16r27EF. "misc math A"
		Array with: 16r27F0 with: 16r27FF. "supplimental arrow A"
		Array with: 16r2900 with: 16r297F. "supplimental arrow B"
		Array with: 16r2980 with: 16r29FF. "misc math B"
		Array with: 16r2A00 with: 16r2AFF. "supplimental math op"
		Array with: 16r2900 with: 16r297F. "supplimental arrow B"
		Array with: 16r2E80 with: 16r2EFF. "cjk radicals suppliment"
		Array with: 16r2F00 with: 16r2FDF. "kangxi radicals"
		Array with: 16r3000 with: 16r303F. "cjk symbols"
		Array with: 16r3040 with: 16r309F. "hiragana"
		Array with: 16r30A0 with: 16r30FF. "katakana"
		Array with: 16r3190 with: 16r319F. "kanbun"
		Array with: 16r31F0 with: 16r31FF. "katakana extension"
		Array with: 16r3200 with: 16r32FF. "enclosed CJK"
		Array with: 16r3300 with: 16r33FF. "CJK compatibility"
		Array with: 16r3400 with: 16r4DBF. "CJK unified extension A"
		Array with: 16r4E00 with: 16r9FAF. "CJK ideograph"
		Array with: 16rF900 with: 16rFAFF. "CJK compatiblity ideograph"
		Array with: 16rFE30 with: 16rFE4F. "CJK compatiblity forms"
		Array with: 16rFF00 with: 16rFFEF. "half and full"
	}.

	^ basics, etc.
