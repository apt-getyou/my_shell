#!/bin/bash
rm -rf /home/name/.cache/compiz;
rm -rf /home/name/.cache/compiz-1;
rm -rf /home/name/.cache/compizconfig-1;
rm -rf /home/name/.config/compiz;
rm -rf /home/name/.config/compiz-1;
rm -rf /home/name/.config/compizconfig-1;
rm -rf /home/name/.gconf/apps/compiz;
rm -rf /home/name/.gconf/apps/compiz-1;
rm -rf /home/name/.gconf/apps/compizconfig-1;
pgrep -u liubowen | xargs kill
