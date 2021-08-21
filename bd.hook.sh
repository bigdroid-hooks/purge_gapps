#           - Only for advanced scripting -
#           ###############################

#   SRC_DIR             % The 'src' dir is the mountpoint of the project operating-system IMAGE.
#
#   HOOK_DIR            % This variable points to the root-dir
#                       % of a bigdroid hook which is being run.
#
#   MOUNT_DIR           % The parent dir which holds other child mountpoint dirs.
#                       % Followed by: system, secondary_ramdisk, initial_ramdisk and install_ramdisk.
#                       % Use `SYSTEM_MOUNT_DIR`, `SECONDARY_RAMDISK_MOUNT_DIR`
#                       % `INITIAL_RAMDISK_MOUNT_DIR`, `INSTALL_RAMDISK_MOUNT_DIR` variables for path.
#
#   TMP_DIR             % You can use this dir for storing temporary files.
#                       % It's equivalent '/tmp' dir but for bigdroid hooks.
#
#   SECONDARY_RAMDISK   % This is either true or false aka a bolean.
#                       % Depends on whether the project operating-system has a ramdisk.img
#
#   SYSTEM_IMAGE        % This points to the project system image (system.sfs or system.img) file.
#
#   @@ Tip: Also all the varaibles defined in the project `Bigdroid.meta` can be used.



#           General Functions - BigDroid Utils
#              - For easy hooks scripting -
#           ##################################
#
#   gclone              % Copy(rsync) files preserving all their attrs with progress indicator.
#                       % Example: `gclone "$HOOK_DIR/myfile.so" "$SYSTEM_DIR/lib64"`
#
#   wipedir             % Easily wipe/empty a dir(childs) without removing it's parent.
#                       % Example: `wipedir "$INSTALL_RAMDISK_MOUNT_DIR/grub"`
#
#   @@ Protip: Take a look at 'src/utils.sh'
#
#
#
#
#             libgearlock - GearLock utils
#     - Some native gearlock vars and functions -
#           ###############################
#
#   %% Simply take a look at 'https://github.com/bigdroid/bigdroid/blob/main/src/libgearlock.sh' to know
#   %% which gearlock variables and functions are available for use.


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
	geco "\n>>>> Removing $bloat\c" && rm -r "$1/$bloat" 2>/dev/null || geco " :: Failed"
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
		read -n1 -p "$(geco "\n++++ Sure to remove Google/MicroG apps ?  [N / y]  ")" c

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
