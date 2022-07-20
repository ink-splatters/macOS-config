#!/bin/bash


set -e

if test -z ${VOLUME} ; then
	if test -z ${VOLUME} ; then
		VOLUME=/Volumes/Data
		echo '$VOLUME env variable is not set'
		echo "Using default: $VOLUME. Sleeping for 3 sec..."
		sleep3
	fi

	exit 1
fi
 
echo -- cleaning volume: "$VOLUME"

if [[ "$1" == "--deep" || "$1" == "-D" ]] ; then
	echo -- Deep cleaning enabled
	deep_clean=1
fi

c() {
	if test -z $2 ; then
		local mindepth=1
	else
		local mindepth=$2
	fi

	
	set +e
	find "$1" -name . -o -prune -mindepth $mindepth -exec rm -rf -- {} +
	set -e
	echo -- "$(pwd)/$1"
}

c_many() {

	for p in "$@" ; do
		c "$p"	
	done
}

push() {
	pushd "$1" 2>&1 >/dev/null

}

pop() {
	popd 2>&1 >/dev/null || true

}

c_user() {

	push "$1"/Library

		c_many \
				Assistant \
				Assistants \
				Biome \
				Caches \
				Cookies \
				CoreFollowUp \
				DataDeliveryServices \
				DoNotDisturb \
				GameKit \
				HTTPStorages \
				HomeKit \
				Keychains/413F0C1D-A2C1-542C-B8EE-7CB72BF8BDD9/Analytics \
				Logs \
				Maps \
				Metadata \
				PersonalizationPortrait \
				Preferences/ByHost \
				studentd \
				WebKit \
				Weather \
				Trial \
				SyncedPreferences \
				Suggestions \
				Staging \
				Sharing \
				Services


		rm -rf "Application Scripts"/*apple*
		rm -rf "Application Scripts"/*Apple*

		if ! test -z ${deep_clean} ; then
			c_many \
					Calendars \
					CallServices \
					ColorPickers \
					Colors \
					Compositions \
					Contacts \
					ContainerManager \
					"Input Methods" \
					"Internet Plugins" \
					Keyboard \
					"Keyboard Layouts" \
					KeyboardServices \
					Mail \
					Photos \
					Printers \
					Reminders \
					"Saved Application State" \
					Shortcuts \
					Sounds \
					Spelling \
					Translation

			rm -rf Containers/*apple*
			rm -rf Containers/*Apple*
			rm -rf "Group Containers"/*apple*
			rm -rf "Group Containers"/*Apple*
		fi

		push "Application Support"

			c_many CrashReporter \
				Knowledge \
				com.apple.ContextStoreAgent \
				com.apple.MediaPlayer \
				com.apple.ap.promotedcontentd \
				com.apple.avfoundation \
				com.apple.backgroundtaskmanagementagent \
				com.apple.exchangesync \
				com.apple.replayd \
				com.apple.sharedfilelist \
				com.apple.spotlight \
		pop # Application Support
			
	
	pop # user home / Library

}

push "$VOLUME"

	push private
		c tmp
	push var		

		c_many audit \
			dirs_cleaner \
			log \
			logs \
			networkd \
			root/Library \
			run \
			tmp \
			vm

		c folders 2

		push db
			c_many  \
				CoreDuet \
				DiagnosticPipeline \
				DiagnosticsReporter \
				DifferentialPrivacy \
				DuetActivityScheduler \
				DumpPanic \
				GPURestartReporter \
				PanicReporter \
				Spotlight \
				Spotlight-V100 \
				analyticsd \
				cmiodalassistants \
				locationd \
				diagnostics \
				findmydevice \
				knowledgegraphd \
				reportmemoryexception \
				rmd \
				searchparty \
				spindump \
				sysdiagnose \
				systemstats \
				uuidtext \
				accessoryupdater \
				awdd
		pop # db
	pop # var
	pop # private


	push Library
		c_many \
				Bluetooth \
				Caches \
				CoreAnalytics \
				Logs \
				OSAnalytics \
				StagedExtensions

		push Application\ Support
			c_many \
				ApplePushService \
				CrashReporter
		pop

	pop # Library


	####

	users=$(dscl -f "$VOLUME"/private/var/db/dslocal/nodes/Default localonly -list /Local/Target/Users | grep -vEo '_.*|daemon|nobody|root')
	push Users	
		for u in ${users[@]} ; do
			c_user $u 
		done
	pop # Users


pop # $VOLUME
