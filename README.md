Batify
======

*Batify is an udevrule-file triggering plug and critical battery level notifications
(using libnotify and [xpub](https://github.com/Ventto/xpub))*

## Changes in this fork

- Battery level threshold for when notifications are sent  
- Transient notifications support (using `notify-send -e`)  
- Each notification replaces the previous one sent by Batify (no stacking/overlapping)  
- Uses an external script: `batify.sh`

## Perks

* [x] **Minimal**: only one udevrule-file and one script file(using *libnotify*).
* [x] **Everywhere**: displays notifications on any current graphical session.
* [x] **Support**: for XWayland as well.

# Installation

## Requirements

Using libnotify, you might need to install a [notification server](https://wiki.archlinux.org/index.php/Desktop_notifications).

## Package (AUR)

```
$ yaourt -S batify
```

## Manually

```
$ git clone --recursive https://github.com/Xartoks/batify.git
$ cd batify
$ sudo make install
```


# Notifications

| Description | Level |
|---|---|
| Battery level is 10,15 or 20% | normal |
| Battery level is less or equal to 5% | critical |
| AC adapter plugged-in | low |
| AC adapter unplugged | low |

# Troubleshooting

## No battery level warnings displayed

* You might need to replace `BAT0` with your battery identifier:

```bash
ACTION=="change", KERNEL=="BAT0", \
```
