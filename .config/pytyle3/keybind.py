# This is a python script. Pay attention to the syntax and indentation
import state
import tile

bindings = {
# You can use Control and Shift. Alt is Mod1, Super is Mod4.

#Available commands :
# tile: start tiling
# untile: stop tiling and move the windows back to their original position
# cycle: switch between horizontal and vertical tiling

# increase_master: increase the space allocated to master windows
# decrease_master: increase the space allocated to slave windows
# add_master: send a window from the slave group to the master group
# remove_master: send a window from the master group to the slave group

# prev_client: Focus the previous window
# next_client: Focus the next window
# focus_master: Focus the master window

# switch_prev_client: switch active window with previous
# switch_next_client: switch active window with next
# rotate: shift all windows' positions (clockwise)
# make_master: send active window to the master position

	'Mod4-t': tile.cmd('tile'),
    'Mod4-u': tile.cmd('untile'),
    'Mod4-d': tile.cmd('decrease_master'),
    'Mod4-i': tile.cmd('increase_master'),
    'Mod4-r': tile.cmd('remove_master'),
    'Mod4-a': tile.cmd('add_master'),
	'Mod4-o': tile.cmd('rotate'),
    'Mod4-c': tile.cmd('cycle'),
    'Mod4-j': tile.cmd('prev_client'),
    'Mod4-k': tile.cmd('next_client'),
    'Mod4-h': tile.cmd('switch_prev_client'),
    'Mod4-l': tile.cmd('switch_next_client'),
    'Mod4-m': tile.cmd('make_master'),
    'Mod4-f': tile.cmd('focus_master'),

# quit pytyle
    'Mod4-q': state.quit,
}

