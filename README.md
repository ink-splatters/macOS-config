## macOS Config

opinionated, highly experimental _macOS_ config / hacking playground

### ⚠️ Risk acknowledgement ⚠️ 

#### Everyting presented here should be treated hostile to your precious data and render the system unbootable. In case of Apple Silicon, "unbootable" in most cases means "unusable" unless DFU restored. Mind the author's responsibility clause of the presented MIT license!

**DO. BACKUP. YOUR. DATA.**


## Project Goals

- ditch all of this in the favor of NixOS / nixpkgs / nix-darwin / home-manager and friends
- find the proper tradeoff between _macOS_ functionality vs level of privacy.

Why tradeoff?

E.g., some privacy friendly actions, as disabling system daemons and agents, requires switching off  SIP on a modern system


###### This partially can be healed without disabling SIP, e.g., by using Google Santa endpoint security which can block binaries from loading, including the system ones. This, however, doesn't work realiably because of serivce load order (it's unknown to author how to define custom boot order letting arbitrary `launchd` service run at very early boot stage, without disabling SIP). More, some tightly integrated XPC services, if disabled, cause system hanging badly, most of them - only with the SIP on
 
## Current System Requirements

most of the payload requires [Supevised System](https://support.apple.com/en-gb/guide/deployment/dep1d89f0bff/web).

This, however would imply using some MDM solution _and_ having issued Apple MDM Push Certificate, which officially can't be issued to a private party.
_User-allowed MDM-control (Apple Silicon)_ is (to some extent) alternative to supervision.

It can be enabled in 1TR with `bputil -m`

###### NOTE: all the described does not automatically work at Intel Macs. You may want to investigate this; feel free to come up with PRs.

### iMazing Profile Editor

these profiles are saved from iMazing Profile Editor. You may want to use any other tool, but keep in mind, some of the configuration
uses profile sections introduced very recently. iMazing Profile Editor automatically pulls them from https://github.com/DigiDNA/ProfileManifests

Note: trial version of iMazing contains fully functional profile editor


