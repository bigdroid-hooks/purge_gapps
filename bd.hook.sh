#!/usr/bin/env bash

# Define bloat applist
# PHOENIX_BLOAT=(
# "CZFeedback"
# "CZRecommended"
# "CZSystemUpdate"
# "CZSetupWizard"
# "Email"
# "Gallery2"
# "PrintSpooler"
# "PandaNES"
# "PhoenixOneForx86"
# "StardustBrowser_pad"
# "DeskClock"
# "baidushurufa"
# "launchwork"
# "PrintRecommendationService"
# "JustWork"
# "oowhoo"
# "NotImpoAtAll"
# )

# PRIME_BLOAT=(
# "com.floydwiz.primefeedback"
# "TeleService"
# "Telecom"
# "TelephonyProvider"
# "EmergencyInfo"
# "Eleven"
# "CellBroadcastReceiver"
# "CarrierConfig"
# "CallLogBackup"
# )

GOOGLE_BLOAT=(
"CalendarGooglePrebuilt"
"GoogleTTS"
"ConfigUpdater"

"GoogleBackupTransport"
"GoogleContactsSyncAdapter"
"GoogleCalendarSyncAdapter"
"GoogleFeedback"
"GoogleLoginService"
"GoogleOneTimeInitializer"
"GooglePartnerSetup"
"GoogleServicesFramework"
"Phonesky"
"PrebuiltGmsCore"
"GmsCore"
"PicoTts"
"BooksStub"
"BookmarkProvider"
"CalendarGoogle"
"CloudPrint"
"DeskClockGoogle"
"EditorsDocsStub"
"EditorsSheetsStub"
"EditorsSlidesStub"
"Gmail"
"Gmail2"
"GoogleCalendar"
"GoogleCloudPrint"
"GoogleHangouts"
"GoogleKeep"
"GoogleLatinIme"
"Keep"
"NewsstandStub"
"PartnerBookmarksProvider"
"PrebuiltBugleStub"
"PrebuiltKeepStub"
"QuickSearchBox"
"Vending"
"GmsCore"
"GoogleNow"
"GoogleSearch"
"GoogleHangouts"
"OneTimeInitializer"
"QuickSearchBox"
"Vending"
"Velvet_update"
"GmsCore_update"
"CanvasPackageInstaller"
"ConfigUpdater"
"GoogleBackupTransport"
"SetupWizard"
"Velvet"
"Books"
"Chrome"
"CloudPrint"
"Drive"
"Keep"
"Movies"
"Music"
"NewsStand"
"PlayGames"
"TalkBack"
"ClockGoogle"
"Maps"
"Messenger"
"Photos"
"Youtube"
"CalculatorGoogle"
"TagGoogle"
"CarrierServices"
)
# 
# MICROG_BLOAT=(
# "AuroraStore"
# "FDroid"
# "AuroraServices"
# "FDroidPrivileged"
# "FakeStore"
# "GmsCore"
# "GsfProxy"
# )
# 
# EXTRA_BLOAT=(
# "$SYSTEM_DIR/phoenixos"
# )


# geco "\n ### Warning, this process can be slightly dangerous."
# geco " ### It's recommended that you take a backup of your SystemFS from GearLock Main-Menu"
# read -n1 -p "$(geco "\n++++ Sure to debloat ?  [${BGREEN}Y${RC} / n]  ")" c

rm_bloat(){
	geco "\n>>>> Removing ${PINK}$bloat${RC}\c" && rm -r $1/"$bloat" 2>/dev/null || geco " :: ${PINK}Failed${RC}"
}

# case $c in
# 	
# 	[Yy] )
# 		#### Start PhoenixOS & PrimeOS bloat
# 		echo
# 		for bloat_name in in "${PHOENIX_BLOAT[@]}" "${PRIME_BLOAT[@]}"; do
# 			
# 			for bloat in "${bloat_name}" "${bloat_name,,}"; do
# 				if test -e "$SYSTEM_DIR/app/$bloat"; then
# 					rm_bloat "$SYSTEM_DIR/app"
# 				elif test -e "$SYSTEM_DIR/priv-app/$bloat"; then
# 					rm_bloat "$SYSTEM_DIR/priv-app"
# 				fi
# 			done
# 			
# 		done
# 		#### End PhoenixOS & PrimeOS bloat
# 
# 		#### Start Extra bloat
# 		for bloat in "${EXTRA_BLOAT[@]}"; do
# 			test -e "$bloat" && rm_bloat
# 		done
# 		#### End Extra bloat

		#### Start Google/MicroG debloat
		geco "\n\n ### If you want to unGoogle / unMicroG then press Y (Warning, this means removing PlayStore & GooglePlayServices)"
		read -n1 -p "$(geco "\n++++ Sure to remove Google/MicroG apps ?  [${BGREEN}N${RC} / y]  ")" c
		
		case $c in
		
			[Nn] )
			
				geco "\n+++ ${_as_you_wish_}"
			
			;;
			
			[Yy] )
			
				echo
				for bloat_name in "${GOOGLE_BLOAT[@]}" "${MICROG_BLOAT[@]}"; do
					
					for bloat in "${bloat_name}" "${bloat_name,,}"; do
						if test -e "$SYSTEM_DIR/app/$bloat"; then
							rm_bloat "$SYSTEM_DIR/app"
						elif test -e "$SYSTEM_DIR/priv-app/$bloat"; then
							rm_bloat "$SYSTEM_DIR/priv-app"
						fi
					done
					
				done
				echo
			;;
		
		esac
		#### End Google/MicroG debloat

# 	;;
# 	
# 	[Nn] )
# 	
# 		geco "\n+++ ${_as_you_wish_}"
# 	
# 	;;
# 	
# esac
