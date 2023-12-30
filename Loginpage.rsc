/ip firewall filter
add action=add-src-to-address-list address-list=BEFORELOGIN disabled=yes address-list-timeout=5s chain=input dst-port=64873 hotspot=from-client,!auth protocol=tcp comment="EngOsama"  place-before=0;
add action=add-src-to-address-list address-list=ONLOGIN disabled=yes address-list-timeout=10s chain=input dst-port=64873 hotspot=from-client,auth protocol=tcp comment="EngOsama" src-address-list=BEFORELOGIN  place-before=0;
add action=drop chain=forward hotspot=from-client,auth disabled=yes port=80,443,53 protocol=tcp src-address-list=ONLOGIN comment="EngOsamah" place-before=0;
