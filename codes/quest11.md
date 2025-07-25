# 문제 
인자와 read를 함께 사용하여 변수 조합 출력

~$ 80_2_shell_variables_read.sh agument_first
 read input : read_first

input values : agument_first read_first

- 명령어
```
[shinbeomjun@localhost Downloads]$ nano 80_2_shell_variables_read.sh

EOF
read -p "read input : " V_READ
echo "input values : $1 $V_READ" 
EOF

[shinbeomjun@localhost Downloads]$ source 80_2_shell_variables_read.sh agument_first
read input : read_first

input values : agument_first read_first

```