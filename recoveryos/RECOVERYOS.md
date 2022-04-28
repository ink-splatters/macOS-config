# Stuff to be run in RecoveryOS


## Read-only paths 

macOS agressively keeps on harversting very sensitive data locally in order to provide "smart" services like Siri, Suggestions and etc.
it's fine if user desides to trade his/her privacy for usability benefits, unless it's _a choice_.

Having all the invasive features disabled, however, doesn't keep macOS from this harvesting, as it still maintains several databases e.g.
at `/private/var/db/DifferentialPrivacy` and `/private/var/db/CoreDuet` containing sensitive data.

According to controversial "Differential Privacy" approach, some of this data might still be transmited to Apple servers. Though Apple
claims the data transmitted does not contain user-identifiable information, there are evidences that the ML models/settings Apple uses
for data obfuscation, are not tunned for privacy, with the opposite being true: potentially allow Apple to extract highly sensitive information
from the data being transmitted, with very high accuracy.

TODO: add proof

The idea of this script is vanishing all the data in some Apple private paths (this does typically affect system functioning) and
lock them in ro mode. As per documentation, even Apple services can't reset `schg` flag without system reboot

TODO: add proof / verify

### Usage

**WARNING: all the data in the locations passed to the script will be lost!** 
 
`vanish-and-lock.sh [--undo] <paths list>`

- deletes all the data in the specified paths 
- locks them using `chflags -R uchg` and `chflags -R schg` or unlocks using `chflags -R nouchg` and `chflags -R noschg`, if `--undo` flag is passed


