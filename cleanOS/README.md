# Stuff to be run in RecoveryOS

**WARNING Passer-by, beware of using any of these scripts to avoid up to complete data loss!**

## Read-only paths 

macOS agressively keeps on harversting very sensitive data locally in order to provide "smart" services like Siri, Suggestions and etc.
it's fine if user desides to trade his/her privacy for usability benefits, unless it's _a choice_.

Having all the invasive features disabled, however, doesn't keep macOS from this harvesting, as it still maintains several databases, e.g.:
at `/private/var/db/DifferentialPrivacy` and `/private/var/db/CoreDuet`
these and more of them contain highly sensitive user data.
 
TODO: implement

 
`vanish-and-lock.sh [--undo] <paths list>`

- deletes all the data in the specified paths 
- locks them using `chflags -R uchg` and `chflags -R schg` or unlocks using `chflags -R nouchg` and `chflags -R noschg`, if `--undo` flag is passed

## Clearner scripts

TODO: verify, describe


## Extensions to disable

opinionated list of `appex` estensions to be disabled using:

`/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister`, likely with  `-bulkunreg -u -v -R` flags (investigate)

NOTE: that's Apple Internal tool
