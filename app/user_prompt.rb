puts "Welcome to League Of Notifiers"
print "At first, insert the link of your discord webhook: "; $cfg_notify[:webhook] = gets.chomp()
print "Match Start must be notified? (Leave blank for true): ";  $cfg_notify[:notify_match_starts] = gets.chomp() == "" ? true : false
print "Champion kills must be notified? (Leave blank for true): ";  $cfg_notify[:notify_kill] = gets.chomp() == "" ? true : false
print "Monster kills must be notified? (Leave blank for true): ";  $cfg_notify[:notify_turret_destroyed] = gets.chomp() == "" ? true : false
print "Destruction of turrets must be notified? (Leave blank for true): ";  $cfg_notify[:notify_monster_kill] = gets.chomp() == "" ? true : false