# mikrotik
useful mikrotik functions
1-Repalce 
-----------------------------------------------------------------------------------------------------------------
#Replace Function [$Replace "string" "string1" "string2"  number];

#Replace Function [$Replace "string" "string1" "string2"  number]; output is string

#Or [$Replace "string" ("str1","str2","str3") "re_str"  number]; output is string

#Or [$Replace "string" ("str1","str2","str3") ("re_str1","re_str2","re_str3")  number]; output is string 

#Or [$Replace (array)  ("str1","str2","str3") ("re_str1","re_str2","re_str3")  number]; output is array

#Test The Function 

#:put [$Replace "osama test ali" "a" "A" ];

#:put [$Replace "osama test ali" "ama" "AMA" ];

#:put [$Replace "osama test ali" ("ama","te") ("AMA","TE") ];

#:put [$Replace ("osama","test","ali") "test" "TEST" ];

#:put [$Replace ("osama","test","test2","ali") ("test","ali") ("TEST3","ALI") ];
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
