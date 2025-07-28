## **✅ 문제 : 간단한 서버 관리 스크립트 작성**

### **🔧 요구사항**

* `start`: 포트 8000에서 `http.server`를 백그라운드로 실행 (`nohup`, 로그는 `server.log`)

* `stop`: 실행 중인 프로세스를 찾아 종료

* `status`: 프로세스가 실행 중인지 확인하여 출력

* `restart`: 중지 후 다시 실행

  ### **🎯 실행 예시**

  $ ./webserver.sh start  
  서버가 백그라운드에서 시작되었습니다.  
    
  $ ./webserver.sh status  
  서버 실행 중입니다. PID: 13579  
    
  $ ./webserver.sh stop  
  서버가 종료되었습니다.  
    
  $ ./[webserver.sh](http://webserver.sh) tail\_log  
  … log message 확인


문제 모두 조건에 따라:

* `if [ "$1" == "start" ]` 식으로 흐름 제어

* 변수 `PORT`, `PID`, `LOGFILE` 등을 정의해 구성 가능

```
[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ vi webserver.sh

#!/bin/bash
V_F=$1
if [ "$V_F" = "start" ]; then
        nohup python3 -m http.server 8000 --bind 0.0.0.0 > server.log 2>&1 &
        echo "서버가 백그라운드에서 시작되었습니다"
fi

if [ "$V_F" = "status" ]; then
    if ps aux | grep -q "[h]ttp"; then
            V_PID=$(ps aux | grep "[h]ttp" | awk '{print $2}' | head -n 1)
        echo "서버 실행 중입니다. PID: $V_PID"
    else
        echo "서버 실행중이 아닙니다."
    fi
fi

if [ "$V_F" = "stop" ]; then
        V_PID=$(pgrep -f "http.server")
        if [ -n "$V_PID" ]; then
        kill "$V_PID" > /dev/null 2>"server.log"
        disown
        if ps -p "$V_PID" > /dev/null; then
                echo "서버 실행중이 아닙니다."
        else
        echo "서버가 종료되었습니다."
fi
else
        echo "서버 실행중이 아닙니다."
        fi
fi

if [ "$V_F" = "tail_log" ]; then
        tail -f ~/Downloads/webroot/server.log
fi



[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source ./webserver.sh start
서버가 백그라운드에서 시작되었습니다

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source ./webserver.sh status
서버 실행 중입니다. PID: 5831

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source ./webserver.sh tail_log
nohup: ignoring input
127.0.0.1 - - [28/Jul/2025 15:23:37] "GET / HTTP/1.1" 200 -

[shinbeomjun@192.168.0.34 ~/Downloads/webroot]$ source ./webserver.sh stop
서버가 종료되었습니다.

```


