message functions
messageListMenu: aMenu shifted: shifted 
	"Answer the message-list menu"
	^ self menu: aMenu for: #(messageListMenu messageListMenuShifted:) shifted: shifted
