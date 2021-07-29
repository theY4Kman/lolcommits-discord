# Lolcommits Discord

[![Gem](https://img.shields.io/gem/v/lolcommits-discord.svg?style=flat)](http://rubygems.org/gems/lolcommits-discord)

[lolcommits](https://lolcommits.github.io/) takes a snapshot with your
webcam every time you git commit code, and archives a lolcat style image
with it. Git blame has never been so much fun!

This plugin automatically posts your lolcommits to a
[Discord](https://discord.com) channel.

The Discord message will contain the git commit message and repo name. The
SHA is used as the uploaded file name. Posting will be retried (once)
should any error occur.

## Requirements

* Ruby >= 2.3
* A webcam
* [ImageMagick](http://www.imagemagick.org)
* [ffmpeg](https://www.ffmpeg.org) (optional) for animated gif capturing

## Installation

Follow the [install
guide](https://github.com/lolcommits/lolcommits#installation) for
lolcommits first. Then run the following:

    $ gem install lolcommits-discord

## Configuration

Next configure and enable with:

    $ lolcommits --config -p discord
    # set enabled to `true`
    # enter your Discord webhook URL

That's it! Every lolcommit will now be posted to the Discord channel.
To disable simply reconfigure with `enabled: false`.

## License

The gem is available as open source under the terms of
[LGPL-3](https://opensource.org/licenses/LGPL-3.0).

This plugin was inspired by (read: mostly copied from) [lolcommits-slack](http://github.com/lolcommits/lolcommits-slack).
