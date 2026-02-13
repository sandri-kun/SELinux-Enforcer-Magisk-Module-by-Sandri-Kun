# UI Print - Installation Message
ui_print "- Initializing installation..."
ui_print "- Target: Force SELinux Enforcing"
ui_print " "
ui_print "*********************************************"
ui_print "  > Applying fix for 'SELinux Flag is Enabled'"
ui_print "  > Setting system prop to Enforcing..."
ui_print "*********************************************"
ui_print " "

# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
