# Hyprland systemd integration

User-level systemd unit(s) used by this Hyprland config.

## hyprland-session.target

Wraps `graphical-session.target` so user services like `xdg-desktop-portal.service`
(which has `Requisite=graphical-session.target`) can start under Hyprland.

### Install

systemd's `--user` manager only searches these paths:

1. `~/.config/systemd/user/`
2. `/etc/systemd/user/`
3. `/usr/lib/systemd/user/`

It does **not** search `~/.config/hypr/`. So symlink the unit into the user
directory:

```sh
mkdir -p ~/.config/systemd/user
ln -sf ~/.config/hypr/systemd/hyprland-session.target \
       ~/.config/systemd/user/hyprland-session.target
systemctl --user daemon-reload
```

### Activation

`hyprland.conf` has:

```
exec-once = systemctl --user start hyprland-session.target
```

Starting this target pulls `graphical-session.target` up via `BindsTo=`,
satisfying the portal's dependency.
