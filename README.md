# Quake 3 Arena

## Automatic client setup with Ansible

To automatically setup the `ioquake3` package in Linux with ansible just run:

```shell
./setup.sh
```

Tested with:

- Debian 11

## Manual client setup on Linux

Install the `ioquake3` package and maps:

```shell
sudo apt install ioquake3 curl unzip
mkdir -p ~/.q3a
cd ~/.q3a
curl -L https://www.dropbox.com/sh/ovdv74yrft30rmk/AACh-EPOXJUGbUXuTgCOKChwa?dl=1 -o q3a.zip
unzip q3a.zip
rm q3a.zip
curl -L https://www.dropbox.com/s/a7evnvqfn29smi7/quake3-latest-pk3s.zip?dl=1 -o quake3-latest-pk3s.zip
unzip quake3-latest-pk3s.zip
cp -R quake3-latest-pk3s/* .
rm -rf quake3-latest-pk3s
rm quake3-latest-pk3s.zip
```

On Linux the `ioquake3` package has some quirks and in most of the cases setting the display from the ingame menu cases major issues at fullscreen.

To avoid that ensure that no `q3config.cfg` file is present in the `baseq3` directory, use this to search for it in your system:

```shell
find / -name q3config.cfg -type f -delete 2>/dev/null
```

Then edit the `~/.q3a/baseq3/autoexec.cfg` and be sure that the folowing commands are added:

```
cat <<EOF >~/.q3a/baseq3/autoexec.cfg
seta r_mode "-1"
seta r_fullscreen "1"
seta r_customwidth "1920"  # <-- change to your maximum resolution
seta r_customheight "1200"  # <-- change to your maximum resolution
seta cg_fov "115"
seta r_colorbits "32"  # color depth
seta r_lodbias "-2"  # geometric details
seta r_picmip "0"  # texture details
seta r_texturebits "32"  # texture quality
seta r_textureMode "GL_LINEAR_MIPMAP_LINEAR"  # texture filter
EOF
```
