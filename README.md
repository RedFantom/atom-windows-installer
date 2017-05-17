# Atom Windows Installer
#### Inno Setup script to create a better Atom Windows Installer

## Description
In this repository you will find a script for [Inno Setup](https://github.com/jrsoftware/issrc),
that will create a customized Atom Installer, which is more flexible (but admittedly more complicated)
than the Squirrel-based installer. It will allow you to install [atom](https://wwww.github.com/atom/atom)
to the `Program Files` folder on Windows. It will also create the required registry entries to add Atom
to the context menu.

## How to use
All you have to do is insert the path of the unzipped portable Atom package, which you can find on the
[releases page](https://www.github.com/atom/atom/releases) of the GitHub repository of Atom. After that,
all you have to do is compile the script and run the installer. You could of course also just download
the latest Atom release pre-packaged from the releases page in this repository.

## Feedback
Any feedback is welcome! Also, if you want to improve the script, or perhaps even add more features 
(I can't really think of any), please feel free to open an issue or fork the repository.

## License
The script is available under the GNU GPLv3 License, as described in `LICENSE`:

    Atom Windows Installer Inno Setup Script
    Copyright (C) 2017  RedFantom

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
