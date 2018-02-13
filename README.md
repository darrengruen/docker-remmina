# REMMINA docker container

Run remmina in a docker container. Please check out [remmina.org](https://remmina.org) for info.

## Tags

-    ubuntu-17.10
-    1_alpine-3.7 _Built with alpine linux_

## Usage

Running is easy:

_Run a single time w/o saving any config_

```
docker run -it --rm \
    -e DISPLAY=unix"${DISPLAY}" \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name remmina_one_off \
    gruen/remmina:[tag]
```

_Run with persistent configuration_

```
docker run -it --rm \
    -e DISPLAY=unix"${DISPLAY}" \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v [/path/to/conf]:/root/.remmina \
    --name remmina_one_off \
    gruen/remmina:[tag]

```

### Notes

You may need to allow access to your x server. I run `xhost local:root` (may need su) but this may not be the safest way to do so.
