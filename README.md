# macOS Config

This is highly experimental collection of macOS configuration, by the date comprising only a set of `.mobileconfig` profiles
and very likely will be refactored to using Nix and related community tooling like `nix-darwin` and `home-manager`

## Project Goals

The main goal of this project is self-education / research, so the only reason it's open to wider audience
is _b̶e̶c̶a̶u̶s̶e̶ ̶I̶ ̶o̶c̶c̶a̶s̶i̶o̶n̶a̶l̶l̶y̶ ̶c̶h̶o̶s̶e̶ ̶p̶u̶b̶l̶i̶c̶ ̶ ̶o̶p̶t̶i̶o̶n̶ ̶i̶n̶s̶t̶e̶a̶d̶ ̶o̶f̶ ̶p̶r̶i̶v̶a̶t̶e̶ my hope that someone might find it useful.

#### NOTE: it's not, however, being developed with user-friendlinness in mind, at least until transitioning to more usable state. So, you are on your own; however, I do reserve my rigth to comment on issues and take the mentioned there into consideration.

## Similar Projects

plenty of them. Google and check them out first as, very likely, they are in much more mature state.
 
## ⚠️ Risk acknowledgement ⚠️ 

**By using the repo you are accepting the risks described below, but not limited to them. As well as,
you are being highly discouraged from using this repository without having carefully reviewed and understood
what the functionality is!**

Some of the configuration touches the system domains which are crucial for normal `macOS` functioning,
there is always a risk of damaging `macOS` beyond repair without full reinstall.

With `Apple Silicon` this risk becomes substantial and, in some cases, critical to your data:
not directly related, but - `Apple Silicon` may become unbootable, both to normal/safe mode _and Recovery modes (incluing 1TR)_.

In some cases, `Reviving` via `Apple Configurator 2` is possible, but if, for example, `opendirectory` stuff (`/private/var/db/dslocal`) or other crucial things as `/private/var/db/SystemPolicy*` are damaged, `Reviving` won't help, at this point one should consider
**all of their the data to be permanently and irreversibly lost** (at least I could not find solutions to recover it).



Very likely wou would also want to adopt it to your needs.

### Known issue

I personally experienced wierd behavior of macOS, when deleting a Profile from the system, reverts not to previously
known configuration but to macOS default. I don't know if it's just occasional bug or it's a feature.

### Do backup your data

**DO. BACKUP. YOUR. DATA**. It's recommended to create a snapshot as well: `tmutil localsnapshot`


## Current System Requirements

most of the payload requires [Supevised System] (https://support.apple.com/en-gb/guide/deployment/dep1d89f0bff/web). This, however would imply
using some MDM solution _and_ having issued Apple MDM Push Certificate, which officially can't be issued to a private party.

### User-allowed MDM-control (Apple Silicon)

This is (to some extent) alternative to supervision which somwhat works (not in every single case)
It can be enabled on Apple Silicon in 1TR recovery, with 

`bputil -m`

SIP stays intact. Security, however, would be _reduced_ (if not already at this or lower level)

NOTE: Intel is not covered here as the author doesn't possess any. If similar approach works for you at Intel,  please feel free to contribute
to this section.

### iMazing Profile Editor

these profiles are saved from iMazing Profile Editor. You may want to use any other tool, but keep in mind, some of the configuration
uses profile sections introduced very recently. iMazing Profile Editor automatically pulls them from _https://github.com/DigiDNA/ProfileManifests_

Note: trial version of iMazing contains fully functional profile editor

## Features

TODO


