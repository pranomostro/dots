/* See LICENSE file for copyright and license details. */

/* how often to update the statusbar (min value == 1) */
#define UPDATE_INTERVAL 1

/* text to show if no value can be retrieved */
#define UNKNOWN_STR     "n/a"

/* statusbar
- battery_perc (battery percentage) [argument: battery name]
- battery_state (battery charging state) [argument: battery name]
- cpu_perc (cpu usage in percent) [argument: NULL]
- datetime (date and time) [argument: format]
- disk_free (disk usage in percent) [argument: mountpoint]
- disk_perc (disk usage in percent) [argument: mountpoint]
- disk_total (disk usage in percent) [argument: mountpoint]
- disk_used (disk usage in percent) [argument: mountpoint]
- entropy (available entropy) [argument: NULL]
- gid (gid of current user) [argument: NULL]
- hostname [argument: NULL]
- ip (ip address) [argument: interface]
- load_avg (load average) [argument: NULL]
- ram_free (ram usage in percent) [argument: NULL]
- ram_perc (ram usage in percent) [argument: NULL]
- ram_total (ram usage in percent) [argument: NULL]
- ram_used (ram usage in percent) [argument: NULL]
- run_command (run custom shell command) [argument: command]
- temp (temperature in degrees) [argument: temperature file]
- uid (uid of current user) [argument: NULL]
- uptime (uptime) [argument: NULL]
- username (username of current user) [argument: NULL]
- vol_perc (alsa volume and mute status in percent) [argument: soundcard]
- wifi_perc (wifi signal in percent) [argument: wifi card interface name]
- wifi_essid (wifi essid) [argument: wifi card interface name] */
static const struct arg args[] = {
	/* function	format        argument */
	{ battery_perc,	" batt: %s  |",	"BAT0"},
	{ vol_perc,	"  vol: %s  |", 	"default"},
	{ ram_perc,	"  ram: %s  |",		NULL},
	{ cpu_perc,	"  cpu: %s  |",		NULL},
	{ wifi_perc,	"  wifi: %s  |",	"wlp3s0"},
	{ brightness,	"  light: %s  |",	"/sys/class/backlight/radeon_bl0/brightness"},
	{ metrictime,	"  metric: %s  |",	NULL},
	{ datetime,	"  date: %s  |",	"%F"},
	{ datetime,	"  time: %s  |",	"%H:%M:%S"},
	{ run_command,	"  play: %s",	"plng"}
};
