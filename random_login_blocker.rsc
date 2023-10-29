
#--------------------- 1 -------------------------
{
/ip firewall raw
add action=drop chain=prerouting hotspot=from-client,!auth src-address-list=BLOCKED;
add action=jump chain=prerouting content="/login" dst-address-type=local dst-port=80,8080,3128,64870-64878,443 hotspot=from-client,!auth jump-target=TRY_LOGIN protocol=tcp src-address-list=!hotspot-login;
add action=jump chain=TRY_LOGIN content="username=" jump-target=CHECK;
add action=jump chain=TRY_LOGIN content="user=" jump-target=CHECK;
add action=add-src-to-address-list address-list=BLOCKED address-list-timeout=5m chain=CHECK log=yes log-prefix="BLOCK LOGIN USER :" src-address-list=hotspot-login-10;
:for i from=10 to=1 step=-1 do={add action=add-src-to-address-list address-list="hotspot-login-$i" address-list-timeout=2m chain=CHECK src-address-list=("hotspot-login-".($i-1));};
add action=add-src-to-address-list address-list=hotspot-login-0 address-list-timeout=1m chain=CHECK;
add action=add-src-to-address-list address-list=hotspot-login src-address-list=!hotspot-login-10 address-list-timeout=1s chain=CHECK;
add action=accept chain=CHECK;
}


#--------------------- 2 -------------------------

/ip firewall raw add action=drop chain=prerouting hotspot=from-client,!auth src-address-list=BLOCKED place-before=0;
/system scheduler add start-date="Jan/01/2000" start-time="00:00:00" name="BLOCKER" interval=00:01:00 on-event="{\r\
    \n:local Time [/system clock get time];\r\
    \n:local IPS [:toarray \"\"];\r\
    \n:foreach i in=[/log print as-value where topics=hotspot,info,debug && message~\"login failed\" && time>(\$Time-00:03:00) && time<(\$Time+00:03:00)] do={\
    :local IP [:pick (\$i->\"message\") ([:find (\$i->\"message\") (\"(\")]+1) [:find (\$i->\"message\") (\")\")]];:set (\$IPS->\$IP) ((\$IPS->\$IP)+1);};\r\
    \n:foreach i,n in=\$IPS do={:if (\$n>=20) do={/ip firewall address-list add address=\$i list=BLOCKED timeout=00:05:00;/log warning (\"BLOCK USER IP = \$i\");}}\r\
    \n}\r\
    \n"
