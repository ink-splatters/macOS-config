# macOS Config

highly experimental collection of macOS configuration payload / tooling around it

At the moment only, a set of .mobileconfig profiles have been implemented.

## Project Goals


The main goal of this project is self-education / research, so the only reason it's open to wider audience
is b̶e̶c̶a̶u̶s̶e̶ ̶I̶ ̶o̶c̶c̶a̶s̶i̶o̶n̶a̶l̶l̶y̶ ̶c̶h̶o̶s̶e̶ ̶_̶p̶u̶b̶l̶i̶c̶_̶ ̶ ̶o̶p̶t̶i̶o̶n̶ ̶i̶n̶s̶t̶e̶a̶d̶ ̶o̶f̶ ̶_̶p̶r̶i̶v̶a̶t̶e̶_̶,̶ ̶w̶h̶e̶n̶ ̶c̶r̶e̶a̶t̶i̶n̶g̶ ̶t̶h̶e̶ ̶p̶r̶o̶j̶e̶c̶t̶ my hope that
someone might find it useful.

it's not, however, being developed with user-friendlinness in mind currently, so you are on your own.
I however reserve my rigth to comment on your issues if I have time (unfortunately, mostly not applicable).
 

### Future

The desired state for this one is to become written using `nix` and `nix-darwin` /  `home-manager` 
to provide highly reproducible state of the art macOS bootstrapping / deployment experience,
but the author is noway nearly there yet.

NOTE: there are quite a few repos which aim the similar goals, please check them out fist.
 
## Risk acknowledgement

WARNING: the repo contains configuration composed in a very opinionated, not necessarily clear way.
To maximum possible extent, you are discouraged from using it out-of the box. doing so will:

- very likely ruin existing system configuration on your machine, beyound the impact on a user
you would log in with. From my experience: if you install and delete a profile, touching system essentials,
these settings may be rolled back to _macOS defaults_, and **not** your previous system configuration. 
(not sure if it's a bug or feature)

- as it touches very delicate domains, some of which are critical/crucial for macOS functioning, the damage, in 
theory, might be way beyond ruined config - up to irreversible data loss and / rendering the system unbootable / 
unusable

If the aforementioned, by some reason, does not stop you, please at least carefully review all the files
so that at least you'd be aware what's gonna happen. If still planned to use afterwards, 
you'd very likely want to edit it anyway.

## Current State



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


