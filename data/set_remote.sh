#!/usr/bin/expect
set ip [lindex $argv 0]
set mac [lindex $argv 1]
set ses 1

spawn "ssh" "-l" "user1" "-i" "./id_rsa_router" "10.81.81.13"
set ses $spawn_id
set timeout 200
expect -i $ses "*user1*@*]*>"
exp_send -i $ses "\r"
expect -i $ses "*user1*@*]*>"
exp_send -i $ses "/tool mac-telnet $mac\r"
expect -i $ses "*Login:*"
exp_send -i $ses "client\r"
expect -i $ses "*Password:*"
exp_send -i $ses "client123\r"
exp_send -i $ses "\r"
expect -i $ses "*client*@*]*>"
exp_send -i $ses "/ip address add address=$ip interface=\[/interface ethernet find mac-address=$mac\]\r"
expect -i $ses "*client*@*]*>"
close
