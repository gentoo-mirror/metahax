# Metahax
I made a Gentoo Portage overlay and some ebuilds that didn't seem to exist yet.  It's total haxxx.


## Installation ##
To use this overlay, download and run **[this setup script](https://raw.githubusercontent.com/metafarion/metahax/master/setup-overlay.sh)**.

Alternatively, you can place the [metahax.conf](https://raw.githubusercontent.com/metafarion/metahax/master/metahax.conf) file in `/etc/portage/repos.conf`, create the directory `/var/db/repos/metahax`, and run `emerge --sync`.

NOTE: All ebuilds in this overlay will be masked ~x86/~amd64 until quite a lot of user testing happens.  You'll have to add them individually to `/etc/portage/package.accept_keywords` to install them.  
(See also: https://wiki.gentoo.org/wiki/ACCEPT_KEYWORDS)

## Ebuilds in this overlay ##

**[games-util/minigalaxy](games-util/minigalaxy)** - Simple GOG client for Linux  
http://github.com/sharkwouter/minigalaxy  

**[net-misc/insync-bin](net-misc/insync-bin)** - Full-featured sync client for Google Drive and OneDrive  
http://www.insynchq.com  

**[app-text/pdfchain](app-text/pdfchain)** - Graphical user interface for the PDF Toolkit (PDFtk)  
http://pdfchain.sourceforge.net
