# mikrotik
useful mikrotik functions

-----------------------------------------------------------------------------------------------------------------
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

#------------------------------------------------------------------------------------------
#array to string Function
#------------------------------------------------------------------------------------------
{
#array value
:local arr ("test",43242,10.4.4.1,{"test1"=321},{"test2"=("v1","v2")},{"test3"=({"v1"=100},{"v2"=99})});
#convert array to string
:local str [$Array2Str $arr];
#show string
:put $str;
#return string to array
:local a [parse $str];
#show array
:put [$a];
#get value test3 -> v1 
:put ([$a]->"test3"->"v1");
}
#------------------------------------------------------------------------------------------
#split , map and join functions
#------------------------------------------------------------------------------------------
{
#string 
:local str "osama";
#Split String
:local arr [$Split $str ];
:put $arr;
#function in map
:local function do={:return "($n=$v)";}
:local arr2 [$map $arr $function ];
#Split array after map
:put $arr2;
#Join the array by "," and convert to string
:local str2 [$Join $arr2 ","];
#show the output string
:put $str2;
}
#------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
