# Back in 5

Display a "back in 5" message over your [`tmux`](https://github.com/tmux/tmux) session.

> You are sharing your screen, pairing and your partner has to step out for a moment.
> You decide to use the moment to fetch yourself another coffee.

Now obviously the sensible thing to do here is to ~~message them and let them know you're going to fetch a coffee~~ leave a message on your screen for them to stumble on.

## Installation

Add to `.tmux.conf` with [TPM](https://github.com/tmux-plugins/tpm):

```tmux
set -g @plugin 'hamolicious/back-in-5'
LINKDING_TMUX_MESSAGE_SH= # override top message
LINKDING_TMUX_ART_PATH= # override path where art is chosen randomly from
```

_See [Configuration](#configuration) for more details on variables_

## Usage

Once installed and [`tmux`](https://github.com/tmux/tmux) enviornment reloaded. Simply use `<prefix>b`.

The dashboard shows the time the command was ran, this is so your partner can guestimate how much longer you will be.

Lastly, a random asciiart animal is attached at the bottom in case your partner gets bored.

![terminal-screenshot](https://i.ibb.co/HT0cCsHW/2025-04-26-00-14.png)

## Configuration

The message and art can be overriden with the following environment variables. Place these in your `.tmux.conf` after the plugin definition.

`LINKDING_TMUX_MESSAGE_SH`: A path to a bash script echoing the message, see default below which is used if this variable is left unset.

```bash
#!/bin/bash
echo ""
echo "☕ Coffee break"
echo ""
echo "🕔 Started at: $(date "+%H:%M")"
echo ""
echo "🏃 Back Shortly"
```

`LINKDING_TMUX_ART_PATH`: A path containing any text files, they will be rendered as a "2D block" of text to ensure ascii art is not messed with. Uses the bundled ascii art animals directory curated from https://www.asciiart.eu/

## References

- https://www.asciiart.eu/
