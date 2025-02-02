# unzstd.yazi

Plugin for [Yazi](https://github.com/sxyazi/yazi) to uncompress `.tar.zst` and `.zst` files hovered by cursor.

To install, clone the repo inside your `~/.config/yazi/plugins/`:

```bash
git clone https://git.kyuti.es/HeyImKyu/unzstd.yazi.git unzstd.yazi
# or
git clone https://github.com/HeyImKyu/unzstd.yazi.git unzstd.yazi
```

Then bind it for any combination of keys (here c -> u), in your `keymap.toml`:

```toml
[[manager.prepend_keymap]]
on   = [ "c", "u" ]
run  = "plugin unzstd"
desc = "unzstd"
```
