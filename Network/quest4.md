### **🧪 문제 1: 특정 IP 차단 상태 확인 후 차단 설정**

#### **✅ 실행 예시**

$ sudo ./problem1.sh

\[INFO\] 현재 rich rule 목록에 192.168.0.100 차단 룰이 존재하지 않습니다.

\[INFO\] 차단 룰을 추가합니다...

success

또는

$ sudo ./problem1.sh

\[INFO\] 192.168.0.100은 이미 차단되어 있습니다.

\[SKIP\] 추가 작업을 수행하지 않습니다.
```
[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ vi problem1.sh

#!/bin/bash

V_IP=$1
V_RULE=$(sudo firewall-cmd --list-rich-rules | grep -w "$V_IP")
if [ -z "$V_RULE" ]; then
        echo "[INFO] 현재 rich rule 목록에 $V_IP 차단 룰이 존재하지 않습니다."
        echo "[INFO] 차단 룰을 추가합니다..."
        sudo firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='$V_IP' reject" &> /dev/null
        sudo firewall-cmd --reload &> /dev/null
        echo "success"
else
        echo "[INFO] $V_IP은 이미 차단되어 있습니다."
        echo "[SKIP] 추가 작업을 수행하지 않습니다."
fi

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source problem1.sh 192.168.0.54
[sudo] password for shinbeomjun: 
[INFO] 현재 rich rule 목록에 192.168.0.54 차단 룰이 존재하지 않습니다.
[INFO] 차단 룰을 추가합니다...
success

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source problem1.sh 192.168.0.54
[INFO] 192.168.0.54은 이미 차단되어 있습니다.
[SKIP] 추가 작업을 수행하지 않습니다.
```
---

### **🔒 문제 2: 포트 8080이 열려 있다면 닫기**

#### **✅ 실행 예시**

$ sudo ./problem2.sh

\[INFO\] 포트 8080/tcp 이 열려 있습니다. 제거합니다...

success

또는

$ sudo ./problem2.sh

\[INFO\] 포트 8080/tcp 이 열려 있지 않습니다. 아무 작업도 수행하지 않습니다.

```
[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ vi problem2.sh 8000:tcp

#!/bin/bash

V_PORT=$1
V_GREP=$(sudo firewall-cmd --list-ports | grep -w "$V_PORT")

if [ -z "$V_GREP" ]; then
               echo "[INFO] 포트 $V_PORT이 열려 있지 않습니
다. 아무 작업도 수행하지 않습니다."
       else
               echo "[INFO] 포트 $V_PORT이 열려 있습니다.제
거합니다..."
        sudo firewall-cmd --permanent --remove-port=$V_PORT &> /dev/null
        sudo firewall-cmd --reload &> /dev/null
        echo "success"
fi

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source problem2.sh 8000/tcp
[INFO] 포트 8000/tcp이 열려 있습니다.제거합니다...
success

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source problem2.sh 8000/tcp
[INFO] 포트 8000/tcp이 열려 있지 않습니다. 아무 작업도 수행하지 않습니다.
```
---

