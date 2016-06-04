on run plusorminus
	if plusorminus as string is equal to "minus" then
		set plusorminus to -1
	else
		set plusorminus to 1
	end if
	
	--Open and activate System Preferences
	tell application "System Preferences"
		reveal anchor "mouseTab" of pane id "com.apple.preference.mouse"
	end tell
	
	--Attempt to change settings using System Events
	tell application "System Events" to tell process "System Preferences"
		try
			set curspeed to value of slider "Tracking Speed" of window "Mouse"
			set newspeed to curspeed + (1 * plusorminus)
			set value of slider "Tracking Speed" of window "Mouse" to newspeed
			display notification "Mouse speed set to " & newspeed as string with title "Mouse Speed"
		on error theError
			--An error occured
			display dialog ("Sorry, an error occured while altering Keyboard and Mouse settings:" & return & theError) buttons "OK" default button "OK"
		end try
	end tell
end run