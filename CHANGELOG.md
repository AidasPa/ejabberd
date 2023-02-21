# Version 23.01

General:
- Add `misc:uri_parse/2` to allow declaring default ports for protocols
- CAPTCHA: Add support to define module instead of path to script
- Clustering: Handle `mnesia_system_event mnesia_up` when other node joins this ([#3842](https://github.com/processone/ejabberd/issues/3842))
- ConverseJS: Don't set i18n option because Converse enforces it instead of browser lang ([#3951](https://github.com/processone/ejabberd/issues/3951))
- ConverseJS: Try to redirect access to files `mod_conversejs` to CDN when there is no local copies
- ext_mod: compile C files and install them in ejabberd's `priv`
- ext_mod: Support to get module status from Elixir modules
- make-binaries: reduce log output
- make-binaries: Bump zlib version to 1.2.13
- MUC: Don't store mucsub presence events in offline storage
- MUC: `hibernation_time` is not an option worth storing in room state ([#3946](https://github.com/processone/ejabberd/issues/3946))
- Multicast: Jid format when `multicastc` was cached ([#3950](https://github.com/processone/ejabberd/issues/3950))
- mysql: Pass `ssl` options to mysql driver
- pgsql: Do not set `standard_conforming_strings` to `off` ([#3944](https://github.com/processone/ejabberd/issues/3944))
- OAuth: Accept `jid` as a HTTP URL query argument
- OAuth: Handle when client is not identified
- PubSub: Expose the `pubsub#type` field in `disco#info` query to the node ([#3914](https://github.com/processone/ejabberd/issues/3914))
- Translations: Update German translation

Admin:
- `api_permissions`: Fix option crash when doesn't have `who:` section
- `log_modules_fully`: New option to list modules that will log everything
- `outgoing_s2s_families`: Changed option's default to IPv6, and fall back to IPv4
- Fix bash completion when using Relive or other install methods
- Fix portability issue with some shells ([#3970](https://github.com/processone/ejabberd/issues/3970))
- Allow admin command to subscribe new users to `members_only` rooms
- Use alternative `split/2` function that works with Erlang/OTP as old as 19.3
- Silent warning in OTP24 about not specified `cacerts` in SQL connections
- Fix compilation warnings with Elixir 1.14

DOAP:
- Support extended `-protocol` erlang attribute
- Add extended RFCs and XEP details to some protocol attributes
- `tools/generate-doap.sh`: New script to generate DOAP file, add `make doap` ([#3915](https://github.com/processone/ejabberd/issues/3915))
- `ejabberd.doap`: New DOAP file describing ejabberd supported protocols

MQTT:
- Add MQTT bridge module
- Add support for certificate authentication in MQTT bridge
- Implement reload in MQTT bridge
- Add support for websockets to MQTT bridge
- Recognize ws5/wss5 urls in MQTT bridge
- `mqtt_publish`: New hook for MQTT publish event
- `mqtt_(un)subscribe`: New hooks for MQTT subscribe & unsubscribe events

VSCode:
- Improve `.devcontainer` to use use devcontainer image and `.vscode`
- Add `.vscode` files to instruct VSCode how to run ejabberd
- Add Erlang LS default configuration
- Add Elvis default configuration

# Version 22.10

Core:
- Add `log_burst_limit_*` options ([#3865](https://github.com/processone/ejabberd/issues/3865))
- Support `ERL_DIST_PORT` option to work without epmd
- Auth JWT: Catch all errors from `jose_jwt:verify` and log debugging details ([#3890](https://github.com/processone/ejabberd/issues/3890))
- CAPTCHA: Support `@VERSION@` and `@SEMVER@` in `captcha_cmd` option ([#3835](https://github.com/processone/ejabberd/issues/3835))
- HTTP: Fix unix socket support ([#3894](https://github.com/processone/ejabberd/issues/3894))
- HTTP: Handle invalid values in `X-Forwarded-For` header more gracefuly
- Listeners: Let module take over socket
- Listeners: Don't register listeners that failed to start in config reload
- `mod_admin_extra`: Handle empty roster group names
- `mod_conversejs`: Fix crash when mod_register not enabled ([#3824](https://github.com/processone/ejabberd/issues/3824))
- `mod_host_meta`: Complain at start if listener is not encrypted
- `mod_ping`: Fix regression on `stop_ping` in clustering context ([#3817](https://github.com/processone/ejabberd/issues/3817))
- `mod_pubsub`: Don't crash on command failures
- `mod_shared_roster`: Fix cache invalidation
- `mod_shared_roster_ldap`: Update roster_get hook to use `#roster_item{}`
- `prosody2ejabberd`: Fix parsing of scram password from prosody

MIX:
- Fix MIX's filter_nodes
- Return user jid on join
- `mod_mix_pam`: Add new MIX namespaces to disco features
- `mod_mix_pam`: Add handling of IQs with newer MIX namespaces
- `mod_mix_pam`: Do roster pushes on join/leave
- `mod_mix_pam`: Parse sub elements of the mix join remote result
- `mod_mix_pam`: Provide MIX channels as roster entries via hook
- `mod_mix_pam`: Display joined channels on webadmin page
- `mod_mix_pam`: Adapt to renaming of `participant-id` from mix_roster_channel record
- `mod_roster`: Change hook type from `#roster{}` to `#roster_item{}`
- `mod_roster`: Respect MIX `<annotate/>` setting
- `mod_roster`: Adapt to change of mix_annotate type to boolean in roster_query
- `mod_shared_roster`: Fix wrong hook type `#roster{}` (now `#roster_item{}`)

MUC:
- Store role, and use it when joining a moderated room ([#3330](https://github.com/processone/ejabberd/issues/3330))
- Don't persist `none` role ([#3330](https://github.com/processone/ejabberd/issues/3330))
- Allow MUC service admins to bypass max_user_conferences limitation
- Show allow_query_users room option in disco info ([#3830](https://github.com/processone/ejabberd/issues/3830))
- Don't set affiliation to `none` if it's already `none` in `mod_muc_room:process_item_change/3`
- Fix mucsub unsubscribe notification payload to have muc_unsubcribe in it
- Allow muc_{un}subscribe hooks to modify sent packets
- Pass room state to muc_{un}subscribed hook
- The archive_msg export fun requires MUC Service for room archives
- Export `mod_muc_admin:get_room_pid/2`
- Export function for getting room diagnostics

SQL:
- Handle errors reported from begin/commit inside transaction
- Make connection close errors bubble up from inside sql transaction
- Make first sql reconnect wait shorter time
- React to sql driver process exit earlier
- Skip connection exit message when we triggered reconnection
- Add syntax_tools to applications, required when using ejabberd_sql_pt ([#3869](https://github.com/processone/ejabberd/issues/3869))
- Fix mam delete_old_messages_batch for sql backend
- Use `INSERT ... ON DUPLICATE KEY UPDATE` for upsert on mysql
- Update mysql library
- Catch mysql connection being close earlier

Build:
- `make all`: Generate start scripts here, not in `make install` ([#3821](https://github.com/processone/ejabberd/issues/3821))
- `make clean`: Improve this and "distclean"
- `make deps`: Ensure deps configuration is ran when getting deps ([#3823](https://github.com/processone/ejabberd/issues/3823))
- `make help`: Update with recent changes
- `make install`: Don't leak DESTDIR in files copied by 'make install'
- `make options`: Fix error reporting on OTP24+
- `make update`: configure also in this case, similarly to `make deps`
- Add definition to detect OTP older than 25, used by ejabberd_auth_http
- Configure eimp with mix to detect image convert properly ([#3823](https://github.com/processone/ejabberd/issues/3823))
- Remove unused macro definitions detected by rebar3_hank
- Remove unused header files which content is already in xmpp library

Container:
- Get ejabberd-contrib sources to include them
- Copy `.ejabberd-modules` directory if available
- Do not clone repo inside container build
- Use `make deps`, which performs additional steps ([#3823](https://github.com/processone/ejabberd/issues/3823))
- Support `ERL_DIST_PORT` option to work without epmd
- Copy `ejabberd-docker-install.bat` from docker-ejabberd git and rename it
- Set a less frequent healthcheck to reduce CPU usage ([#3826](https://github.com/processone/ejabberd/issues/3826))
- Fix build instructions, add more podman examples

Installers:
- make-binaries: Include CAPTCHA script with release
- make-binaries: Edit rebar.config more carefully
- make-binaries: Fix linking of EIMP dependencies
- make-binaries: Fix GitHub release version checks
- make-binaries: Adjust Mnesia spool directory path
- make-binaries: Bump Erlang/OTP version to 24.3.4.5
- make-binaries: Bump Expat and libpng versions
- make-packages: Include systemd unit with RPM
- make-packages: Fix permissions on RPM systems
- make-installers: Support non-root installation
- make-installers: Override code on upgrade
- make-installers: Apply cosmetic changes

External modules:
- ext_mod: Support managing remote nodes in the cluster
- ext_mod: Handle correctly when COMMIT.json not found
- Don't bother with COMMIT.json user-friendly feature in automated user case
- Handle not found COMMIT.json, for example in GH Actions
- Add WebAdmin page for managing external modules

Workflows Actions:
- Update workflows to Erlang 25
- Update workflows: Ubuntu 18 is deprecated and 22 is added
- CI: Remove syntax_tools from applications, as fast_xml fails Dialyzer
- Runtime: Add Xref options to be as strict as CI

# Version 22.05

Core
- C2S: Don't expect that socket will be available in `c2s_terminated` hook
- Event handling process hook tracing
- Guard against `erlang:system_info(logical_processors)` not always returning a number
- `domain_balancing`: Allow for specifying `type` only, without specifying `component_number`

MQTT
- Add TLS certificate authentication for MQTT connections
- Fix login when generating client id, keep connection record (#3593)
- Pass property name as expected in mqtt_codec (fixes login using MQTT 5)
- Support MQTT subscriptions spread over the cluster (#3750)

MUC
- Attach meta field with real jid to mucsub subscription events
- Handle user removal
- Stop empty MUC rooms 30 seconds after creation
- `default_room_options`: Update options configurable
- `subscribe_room_many_max_users`: New option in `mod_muc_admin`

mod_conversejs
- Improved options to support `@HOST@` and `auto` values
- Set `auth` and `register` options based on ejabberd configuration
- `conversejs_options`: New option
- `conversejs_resources`: New option

PubSub
- `mod_pubsub`: Allow for limiting `item_expire` value
- `mod_pubsub`: Unsubscribe JID on whitelist removal
- `node_pep`: Add config-node and multi-items features (#3714)

SQL
- Improve compatibility with various db engine versions
- Sync old-to-new schema script with reality (#3790)
- Slight improvement in MSSQL testing support, but not yet complete

Other Modules
- `auth_jwt`: Checking if an user is active in SM for a JWT authenticated user (#3795)
- `mod_configure`: Implement Get List of Registered/Online Users from XEP-0133
- `mod_host_meta`: New module to serve host-meta files, see XEP-0156
- `mod_mam`: Store all mucsub notifications not only message notifications
- `mod_ping`: Delete ping timer if resource is gone after the ping has been sent
- `mod_ping`: Don't send ping if resource is gone
- `mod_push`: Fix notifications for pending sessions (XEP-0198)
- `mod_push`: Keep push session ID on session resume
- `mod_shared_roster`: Adjust special group cache size
- `mod_shared_roster`: Normalize JID on unset_presence (#3752)
- `mod_stun_disco`: Fix parsing of IPv6 listeners

Dependencies
- autoconf: Supported from 2.59 to the new 2.71
- fast_tls: Update to 1.1.14 to support OpenSSL 3
- jiffy: Update to 1.1.1 to support Erlang/OTP 25.0-rc1
- luerl: Update to 1.0.0, now available in hex.pm
- lager: This dependency is used only when Erlang is older than 22
- rebar2: Updated binary to work from Erlang/OTP 22 to 25
- rebar3: Updated binary to work from Erlang/OTP 22 to 25
- `make update`: Fix when used with rebar 3.18

Compile
- `mix release`: Copy `include/` files for ejabberd, deps and otp, in `mix.exs`
- `rebar3 release`: Fix ERTS path in `ejabberdctl`
- `configure.ac`: Set default ejabberd version number when not using git
- `mix.exs`: Move some dependencies as optional
- `mix.exs`: No need to use Distillery, Elixir has built-in support for OTP releases (#3788)
- `tools/make-binaries`: New script for building Linux binaries
- `tools/make-installers`: New script for building command line installers

Start
- New `make relive` similar to `ejabberdctl live` without installing
- `ejabberdctl`: Fix some warnings detected by ShellCheck
- `ejabberdctl`: Mention in the help: `etop`, `ping` and `started`/`stopped`
- `make rel`: Switch to paths: `conf/`, `database/`, `logs/`
- `mix.exs`: Add `-boot` and `-boot_var` in `ejabberdctl` instead of adding `vm.args`
- `tools/captcha.sh`: Fix some warnings detected by ShellCheck

Commands
- Accept more types of ejabberdctl commands arguments as JSON-encoded
- `delete_old_mam_messages_batch`: New command with rate limit
- `delete_old_messages_batch`: New command with rate limit
- `get_room_occupants_number`: Don't request the whole MUC room state (#3684, #1964)
- `get_vcard`: Add support for MUC room vCard
- `oauth_revoke_token`: Add support to work with all backends
- `room_unused_*`: Optimize commands in SQL by reusing `created_at`
- `rooms_unused_...`: Let `get_all_rooms` handle `global` argument (#3726)
- `stop|restart`: Terminate ejabberd_sm before everything else to ensure sessions closing (#3641)
- `subscribe_room_many`: New command

Translations
- Updated Catalan
- Updated French
- Updated German
- Updated Portuguese
- Updated Portuguese (Brazil)
- Updated Spanish

Workflows
- CI: Publish CT logs and Cover on failure to an external GH Pages repo
- CI: Test shell scripts using ShellCheck (#3738)
- Container: New workflow to build and publish containers
- Installers: Add job to create draft release
- Installers: New workflow to build binary packages
- Runtime: New workflow to test compilation, rel, starting and ejabberdctl

# Version 21.12

Commands
- `create_room_with_opts`: Fixed when using SQL storage
- `change_room_option`: Add missing fields from config inside `mod_muc_admin:change_options`
- piefxis: Fixed arguments of all commands

Modules
- mod_caps: Don't forget caps on XEP-0198 resumption
- mod_conversejs: New module to serve a simple page for Converse.js
- mod_http_upload_quota: Avoid `max_days` race
- mod_muc: Support MUC hats (XEP-0317, conversejs/prosody compatible)
- mod_muc: Optimize MucSub processing
- mod_muc: Fix exception in mucsub {un}subscription events multicast handler
- mod_multicast: Improve and optimize multicast routing code
- mod_offline: Allow storing non-composing x:events in offline
- mod_ping: Send ping from server, not bare user JID
- mod_push: Fix handling of MUC/Sub messages
- mod_register: New allow_modules option to restrict registration modules
- mod_register_web: Handle unknown host gracefully
- mod_register_web: Use mod_register configured restrictions

PubSub
- Add `delete_expired_pubsub_items` command
- Add `delete_old_pubsub_items` command
- Optimize publishing on large nodes (SQL)
- Support unlimited number of items
- Support `max_items=max` node configuration
- Bump default value for `max_items` limit from 10 to 1000
- Use configured `max_items` by default
- node_flat: Avoid catch-all clauses for RSM
- node_flat_sql: Avoid catch-all clauses for RSM

SQL
- Use `INSERT ... ON CONFLICT` in SQL_UPSERT for PostgreSQL >= 9.5
- mod_mam export: assign MUC entries to the MUC service
- MySQL: Fix typo when creating index
- PgSQL: Add SASL auth support, PostgreSQL 14
- PgSQL: Add missing SQL migration for table `push_session`
- PgSQL: Fix `vcard_search` definition in pgsql new schema

Other
- `captcha-ng.sh`: "sort -R" command not POSIX, added "shuf" and "cat" as fallback
- Make s2s connection table cleanup more robust
- Update export/import of scram password to XEP-0227 1.1
- Update Jose to 1.11.1 (the last in hex.pm correctly versioned)

# Version 21.07

Compilation
- Add rebar3 3.15.2 binary
- Add support for mix to: `./configure --enable-rebar=mix`
- Improved `make rel` to work with rebar3 and mix
- Add `make dev` to build a development release with rebar3 or mix
- Hex: Add `sql/` and `vars.config` to Hex package files
- Hex: Update mix applications list to fix error `p1_utils is listed as both...`
- There are so many targets in Makefile... add `make help`
- Fix extauth.py failure in test suite with Python 3
- Added experimental support for GitHub Codespaces
- Switch test service from TravisCI to GitHub Actions

Commands:
- Display extended error message in ejabberdctl
- Remove SMP option from ejabberdctl.cfg, `-smp` was removed in OTP 21
- `create_room`: After creating room, store in DB if it's persistent
- `help`: Major changes in its usage and output
- `srg_create`: Update to use `label` parameter instead of `name`

Modules:
- ejabberd_listener: New `send_timeout` option
- mod_mix: Improvements to update to 0.14.1
- mod_muc_room: Don't leak owner JIDs
- mod_multicast: Routing for more MUC packets
- mod_multicast: Correctly strip only other bcc addresses
- mod_mqtt: Allow shared roster group placeholder in mqtt topic
- mod_pubsub: Several fixes when using PubSub with RSM
- mod_push: Handle MUC/Sub events correctly
- mod_shared_roster: Delete cache after performing change to be sure that in cache will be up to date data
- mod_shared_roster: Improve database and caching
- mod_shared_roster: Reconfigure cache when options change
- mod_vcard: Fix invalid_encoding error when using extended plane characters in vcard
- mod_vcard: Update econf:vcard() to generate correct vcard_temp record
- WebAdmin: New simple pages to view mnesia tables information and content
- WebSocket: Fix typos

SQL:
- MySQL Backend Patch for scram-sha512
- SQLite: When exporting for SQLite, use its specific escape options
- SQLite: Minor fixes for new_sql_schema support
- mod_privacy: Cast as boolean when exporting privacy_list_data to PostgreSQL
- mod_mqtt: Add mqtt_pub table definition for MSSQL
- mod_shared_roster: Add missing indexes to `sr_group` tables in all SQL databases

# Version 21.04

API Commands:
- `add_rosteritem/...`: Add argument guards to roster commands
- `get_user_subscriptions`: New command for MUC/Sub
- `remove_mam_for_user_with_peer`: Fix when removing room archive
- `send_message`: Fix bug introduced in ejabberd 21.01
- `set_vcard`: Return modules errors

Build and setup:
- Allow ejabberd to be compatible as a dependency for an Erlang project using rebar3
- CAPTCHA: New question/answer-based CAPTCHA script
- `--enable-lua`: new configure option for luerl instead of --enable-tools
- Remove support for HiPE, it was experimental and Erlang/OTP 24 removes it
- Update `sql_query` record to handle the Erlang/OTP 24 compiler reports
- Updated dependencies to fix Dialyzer warnings

Miscellaneous:
- CAPTCHA: Update `FORM_TYPE` from captcha to register
- LDAP: fix eldap certificate verification
- MySQL: Fix for "specified key was too long"
- Translations: updated the Esperanto, Greek, and Japanese translations
- Websocket: Fix PONG responses

Modules:
- `mod_block_strangers`: If stanza is type error, allow it passing
- `mod_caps`: Don't request roster when not needed
- `mod_caps`: Skip reading roster in one more case
- `mod_mam`: Remove `queryid` from MAM fin element
- `mod_mqtt`: When deregistering XMPP account, close its MQTT sessions
- `mod_muc`: Take in account subscriber's affiliation when checking access to moderated room
- `mod_muc`: Use monitors to track online and hard-killed rooms
- `mod_muc`: When occupant is banned, remove his subscriptions too
- `mod_privacy`: Make fetching roster lazy
- `mod_pubsub`: Don't fail on PEP unsubscribe
- `mod_pubsub`: Fix `gen_pubsub_node:get_state` return value
- `mod_vcard`: Obtain and provide photo type in vCard LDAP

# Version 21.01

Miscellaneous changes:
- `log_rotate_size` option: Fix handling of ‘infinity’ value
- `mod_time`: Fix invalid timezone
- Auth JWT: New `check_decoded_jwt` hook runs the default JWT verifier
- MUC: Allow non-occupant non-subscribed service admin send private MUC message
- MUC: New `max_password` and `max_captcha_whitelist` options
- OAuth: New `oauth_cache_rest_failure_life_time` option
- PEP: Skip reading pep nodes that we know won’t be requested due to caps
- SQL: Add sql script to migrate mysql from old schema to new
- SQL: Don’t use REPLACE for upsert when there are “-” fields.
- Shared Rosters LDAP: Add multi-domain support (and flexibility)
- Sqlite3: Fix dependency version
- Stun: Block loopback addresses by default
- Several documentation fixes and clarifications

Commands:
- `decide_room`: Use better fallback value for room activity time when skipping room
- `delete_old_message`: Fix when using sqlite spool table
- `module_install`: Make ext_mod compile module with debug_info flags
- `room_unused_*`: Don’t fetch subscribers list
- `send_message`: Don’t include empty in messages
- `set_room_affiliation`: Validate affiliations

Running:
- Docker: New `Dockerfile` and `devcontainer.json`
- New `ejabberdctl foreground-quiet`
- Systemd: Allow for listening on privileged ports
- Systemd: Integrate nicely with systemd

Translations:
- Moved gettext PO files to a new `ejabberd-po` repository
- Improved several translations: Catalan, Chinese, German, Greek, Indonesian, Norwegian, Portuguese (Brazil), Spanish.

# Version 20.12

- Add support for `SCRAM-SHA-{256,512}-{PLUS}` authentication
- Don't use same value in cache for user don't exist and wrong password
- `outgoing_s2s_ipv*_address`: New options to set ipv4/ipv6 outbound s2s out interface
- s2s_send_packet: this hook now filters outgoing s2s stanzas
- start_room: new hook runs when a room process is started
- check_decoded_jwt: new hook to check decoded JWT after success authentication

* Admin
- Docker: Fix DB initialization
- New sql_odbc_driver option: choose the mssql ODBC driver
- Rebar3: Fully supported. Enable with `./configure --with-rebar=/path/to/rebar3`
- systemd: start ejabberd in foreground

* Modules:
- MAM: Make sure that jid used as base in mam xml_compress is bare
- MAM: Support for MAM Flipped Pages
- MUC: Always show MucSub subscribers nicks
- MUC: Don't forget not-persistent rooms in load_permanent_rooms
- MUC Admin: Better error reporting
- MUC Admin: Fix commands with hibernated rooms
- MUC Admin: Many improvements in rooms_unused_list/destroy
- MUC Admin: create_room_with_opts Store options only if room starts
- Pubsub: Remove 'dag' node plugin documentation
- Push: Fix API call return type on error
- Push: Support cache config changes on reload
- Register: Allow for account-removal-only setup again
- Roster: Make roster subscriptions work better with invalid roster state in db
- Vcard: Fix vCard search by User when using Mnesia
- WebAdmin: Allow vhost admins to view WebAdmin menus
- WebAdmin: Don't do double utf-8 conversion on translated strings
- WebAdmin: Mark dangerous buttons with CSS
- WebSocket: Make websocket send put back pressure on c2s process

# Version 20.07

* Changes in this version
- Add support for using unix sockets in listeners.
- Make this version compatible with erlang R23
- Make room permissions checks more strict for subscribers
- Fix problem with muc rooms crashing when using muc logger
  with some locales
- Limit stat calls that logger module issues
- Don't throw errors when using user_regexp acl rule and
  having non-matching host
- Fix problem with leaving old data when updating shared rosters
- Fix edge case that caused failure of resuming old sessions with
  stream management.
- Fix crash when room that was started with logging enabled was later
  changed to logging disabled
- Increase default shaper limits (this should help with delays for
  clients that are using jingle)
- Fix couple compatibility problems which prevented working on
  erlang R19
- Fix sending presence unavailable when session terminates for
  clients that only send directed presences (helps with sometimes
  not leaving muc rooms on disconnect).
- Prevent supervisor errors for sockets that were closed before
  they were passed to handler modules
- Make stun module work better with ipv6 addresses

# Version 20.03

* Changes in this version
- Add support of ssl connection when connection to mysql
  database (configured with `sql_ssl: true` option)
- Experimental support for cockroachdb when configured
  with postgres connector
- Add cache and optimize queries issued by `mod_shared_roster`,
  this should greatly improve performance of this module when
  used with `sql` backend
- Fix problem with accessing webadmin
- Make webadmin work even when url is missing trailing slash
- When compiling external modules with ext_mod, use flags
  that were detected during compilation of ejabberd
- Make config changed to ldap options be updated when issued
  `reload_config` command
- Fix `room_empty_destory` command
- Fix reporting errors in `send_stanza` command when xml
  passed to it couldn't be passed correctly

# Version 20.02

* Changes in this version
- Fix problems when trying to use string format with unicode
  values directly in xmpp nodes
- Add missing oauth_client table declaration in lite.new.sql
- Improve compatibility with CocroachDB
- Fix importing of piefxis files that did use scram passwords
- Fix importing of piefxis files that had multiple includes
  in them
- Update jiffy dependency
- Allow storage of emojis when using mssql database (Thanks
  to Christoph Scholz)
- Make ejabberd_auth_http be able to use auth_opts
- Make custom_headers options in http modules correctly
  override built-in values
- Fix return value of reload_config and dump_config commands

# Version 20.01

* New features
- Implement OAUTH authentication in mqtt
- Make logging infrastructure use new logger introduced
  in Erlang (requires OTP22)
- New configuration parser/validator
- Initial work on being able to use CockroachDB as database backend
- Add gc command
- Add option to disable using prepared statements on Postgresql
- Implement routine for converting password to SCRAM format
  for all backends not only SQL
- Add infrastructure for having module documentation directly
  in individual module source code
- Generate man page automatically
- Implement copy feature in mod_carboncopy

* Fixes
- Make webadmin work with configurable paths
- Fix handling of result in xmlrpc module
- Make webadmin work even when accessed through not declared domain
- Better error reporting in xmlrpc
- Limit amount of results returned by disco queries to pubsub nodes
- Improve validation of configured JWT keys
- Fix race condition in Redis/SQL startup
- Fix loading order of third party modules
- Fix reloading of ACL rules
- Make account removal requests properly route response
- Improve handling of malformed inputs in send_message command
- Omit push notification if storing message in offline storage
  failed
- Fix crash in stream management when timeout was not set

# Version 19.09

* Admin
- The minimum required Erlang/OTP version is now 19.3
- Fix API call using OAuth (#2982)
- Rename MUC command arguments from Host to Service (#2976)

* Webadmin
- Don't treat 'Host' header as a virtual XMPP host (#2989)
- Fix some links to Guide in WebAdmin and add new ones (#3003)
- Use select fields to input host in WebAdmin Backup (#3000)
- Check account auth provided in WebAdmin is a local host (#3000)

* ACME
- Improve ACME implementation
- Fix IDA support in ACME requests
- Fix unicode formatting in ACME module
- Log an error message on IDNA failure
- Support IDN hostnames in ACME requests
- Don't attempt to create ACME directory on ejabberd startup
- Don't allow requesting certificates for localhost or IP-like domains
- Don't auto request certificate for localhost and IP-like domains
- Add listener for ACME challenge in example config

* Authentication
- JWT-only authentication for some users (#3012)

* MUC
- Apply default role after revoking admin affiliation (#3023)
- Custom exit message is not broadcast (#3004)
- Revert "Affiliations other than admin and owner cannot invite to members_only rooms" (#2987)
- When join new room with password, set pass and password_protected (#2668)
- Improve rooms_* commands to accept 'global' as MUC service argument (#2976)
- Rename MUC command arguments from Host to Service (#2976)

* SQL
- Fix transactions for Microsoft SQL Server (#2978)
- Spawn SQL connections on demand only

* Misc
- Add support for XEP-0328: JID Prep
- Added gsfonts for captcha
- Log Mnesia table type on creation
- Replicate Mnesia 'bosh' table when nodes are joined
- Fix certificate selection for s2s (#3015)
- Provide meaningful error when adding non-local users to shared roster (#3000)
- Websocket: don't treat 'Host' header as a virtual XMPP host (#2989)
- Fix sm ack related c2s error (#2984)
- Don't hide the reason why c2s connection has failed
- Unicode support
- Correctly handle unicode in log messages
- Fix unicode processing in ejabberd.yml

# Version 19.08

* Administration
- Improve ejabberd halting procedure
- Process unexpected erlang messages uniformly: logging a warning
- mod_configure: Remove modules management

* Configuration
- Use new configuration validator
- ejabberd_http: Use correct virtual host when consulting trusted_proxies
- Fix Elixir modules detection in the configuration file
- Make option 'validate_stream' global
- Allow multiple definitions of host_config and append_host_config
- Introduce option 'captcha_url'
- mod_stream_mgmt: Allow flexible timeout format
- mod_mqtt: Allow flexible timeout format in session_expiry option

* Misc
- Fix SQL connections leakage
- New authentication method using JWT tokens
- extauth: Add 'certauth' command
- Improve SQL pool logic
- Add and improve type specs
- Improve extraction of translated strings
- Improve error handling/reporting when loading language translations
- Improve hooks validator and fix bugs related to hooks registration
- Gracefully close inbound s2s connections
- mod_mqtt: Fix usage of TLS
- mod_offline: Make count_offline_messages cache work when using mam for storage
- mod_privacy: Don't attempt to query 'undefined' active list
- mod_privacy: Fix race condition

* MUC
- Add code for hibernating inactive muc_room processes
- Improve handling of unexpected iq in mod_muc_room
- Attach mod_muc_room processes to a supervisor
- Restore room when receiving message or generic iq for not started room
- Distribute routing of MUC messages across all CPU cores

* PubSub
- Fix pending nodes retrieval for SQL backend
- Check access_model when publishing PEP
- Remove deprecated pubsub plugins
- Expose access_model and publish_model in pubsub#metadata

# Version 19.05

* Admin
- The minimum required Erlang/OTP version is now 19.1
- Provide a suggestion when unknown command, module, option or request handler is detected
- Deprecate some listening options: captcha, register, web_admin, http_bind and xmlrpc
- Add commands to get Mnesia info: mnesia_info and mnesia_table_info
- Fix Register command to respect mod_register's Access option
- Fixes in Prosody import: privacy and rooms
- Remove TLS options from the example config
- Improve request_handlers validator
- Fix syntax in example Elixir config file

* Auth
- Correctly support cache tags in ejabberd_auth
- Don't process failed EXTERNAL authentication by mod_fail2ban
- Don't call to mod_register when it's not loaded
- Make anonymous auth don't {de}register user when there are other resources

* Developer
- Rename listening callback from start/2 to start/3
- New hook called when room gets destroyed: room_destroyed
- New hooks for tracking mucsub subscriptions changes: muc_subscribed, muc_unsubscribed
- Make static hooks analyzer working again

* MUC
- Service admins are allowed to recreate room even if archive is nonempty
- New option user_mucsub_from_muc_archive
- Avoid late arrival of get_disco_item response
- Handle get_subscribed_rooms call from mod_muc_room pid
- Fix room state cleanup from db on change of persistent option change
- Make get_subscribed_rooms work even for non-persistant rooms
- Allow non-moderator subscribers to get list of room subscribers

* Offline
- New option bounce_groupchat: make it not bounce mucsub/groupchat messages
- New option use_mam_for_storage: fetch data from mam instead of spool table
- When applying limit of max msgs in spool check only spool size
- Do not store mucsub wrapped messages with no-store hint in offline storage
- Always store ActivityMarker messages
- Don't issue count/message fetch queries for offline from mam when not needed
- Properly handle infinity as max number of message in mam offline storage
- Sort messages by stanza_id when using mam storage in mod_offline
- Return correct value from count_offline_messages with mam storage option
- Make mod_offline put msg ignored by mam in spool when mam storage is on

* SQL:
- Add SQL schemas for MQTT tables
- Report better errors on SQL terms decode failure
- Fix PostgreSQL compatibility in mod_offline_sql:remove_old_messages
- Fix handling of list arguments on pgsql
- Preliminary support for SQL in process_rosteritems command

* Tests
- Add tests for user mucsub mam from muc mam
- Add tests for offline with mam storage
- Add tests for offline use_mam_for_storage
- Initial Docker environment to run ejabberd test suite
- Test offline:use_mam_for_storage, mam:user_mucsub_from_muc_archive used together

* Websocket
- Add WebSockets support to mod_mqtt
- Return "Bad request" error when origin in websocket connection doesn't match
- Fix RFC6454 violation on websocket connection when validating Origin header
- Origin header validation on websocket connection

* Other modules
- mod_adhoc: Use xml:lang from stanza when it's missing in <command/> element
- mod_announce: Add 'sessionid' attribute when required
- mod_bosh: Don't put duplicate polling attribute in bosh payload
- mod_http_api: Improve argument error messages and log messages
- mod_http_upload: Feed whole image to eimp:identify/1
- mod_http_upload: Log nicer warning on unknown host
- mod_http_upload: Case-insensitive host comparison
- mod_mqtt: Support other socket modules
- mod_push: Check for payload in encrypted messages

# Version 19.02

* Admin
- Fix in configure.ac the Erlang/OTP version: from 17.5 to 19.0
- reload_config command: Fix crash when sql_pool_size option is used
- reload_config command: Fix crash when SQL is not configured
- rooms_empty_destroy command: Several fixes to behave more conservative
- Fix serverhost->host parameter name for muc_(un)register_nick API

* Configuration
- Allow specifying tag for listener for api_permission purposes
- Change default ciphers to intermediate
- Define default ciphers/protocol_option in example config
- Don't crash on malformed 'modules' section
- mod_mam: New option clear_archive_on_room_destroy to prevent archive removal on room destroy
- mod_mam: New option access_preferences to restrict who can modify the MAM preferences
- mod_muc: New option access_mam to restrict who can modify that room option
- mod_offline: New option store_groupchat to allow storing group chat messages

* Core
- Add MQTT protocol support
- Fix (un)setting of priority
- Use OTP application startup infrastructure for starting dependencies
- Improve starting order of several dependencies

* MAM
- mod_mam_mnesia/sql: Improve check for empty archive
- disallow room creation if archive not empty and clear_archive_on_room_destroy is false
- allow check if archive is empty for or user or room
- Additional checks for database failures

* MUC
- Make sure that room_destroyed is called even when some code throws in terminate
- Update muc room state after adding extra access field to it
- MUC/Sub: Send mucsub subscriber notification events with from set to room jid

* Shared Roster
- Don't perform roster push for non-local contacts
- Handle versioning result when shared roster group has remote account
- Fix SQL queries

* Miscelanea
- CAPTCHA: Add no-store hint to CAPTCHA challenge stanzas
- HTTP: Reject http_api request with malformed Authentication header
- mod_carboncopy: Don't lose carbons on presence change or session resumption
- mod_mix: Fix submission-id and channel resource
- mod_ping: Fix ping IQ reply/timeout processing (17.x regression)
- mod_private: Hardcode item ID for PEP bookmarks
- mod_push: Improve notification error handling
- PIEFXIS: Fix user export when password is scrammed
- Prosody: Improve import of roster items, rooms and attributes
- Translations: fixed "make translations"
- WebAdmin: Fix support to restart module with new options

# Version 18.12

* MAM data store compression
* Proxy protocol support
* MUC Self-Ping optimization (XEP-0410)
* Bookmarks conversion (XEP-0411)
