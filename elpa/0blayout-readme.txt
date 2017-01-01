 Commentary:

 This global minor mode provides a simple way to switch between layouts and
 the buffers you left open before you switched (unless you closed it).

 It doesn't require any setup at all more than:
 (0blayout-mode)

 When you start Emacs with 0blayout loaded, you will have a default layout
 named "default", and then you can create new layouts (<prefix> C-c), switch
 layouts (<prefix> C-b), and kill the current layout (<prefix> C-k).
 The default <prefix> is (C-c C-l), but you can change it using:
 (0blayout-add-keybindings-with-prefix "<your prefix>")

 You can also customize-variable to change the name of the default session.

 The project is hosted at https://github.com/etu/0blayout
 There you can leave bug-reports and suggestions.

 Another comparable mode is eyebrowse which have been developed for longer.

 License:

 This file is free software you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation either version 3
 of the License, or (at your option) any later version.

 This file is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this file if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 02110-1301, USA.

