# **Linux 권한 관리 실습 문제**

## **실습 환경 설정**

**먼저 다음 명령어들을 실행하여 실습 환경을 구성하세요:**

- \# 실습 디렉터리 생성  
- mkdir permission\_practice  
- cd permission\_practice  
-   
- \# 사용자 및 그룹 생성 (관리자 권한 필요)  
- sudo useradd \-m \-s /bin/bash alice  
- sudo useradd \-m \-s /bin/bash bob  
- sudo useradd \-m \-s /bin/bash charlie  
- sudo useradd \-m \-s /bin/bash diana  
- sudo useradd \-m \-s /bin/bash eve  
-   
- \# 그룹 생성  
- sudo groupadd developers  
- sudo groupadd managers  
-   
- \# 사용자를 그룹에 추가  
- sudo usermod \-a \-G developers alice  
- sudo usermod \-a \-G developers bob  
- sudo usermod \-a \-G developers charlie  
- sudo usermod \-a \-G managers diana  
- sudo usermod \-a \-G managers alice  
- \# eve는 기타 사용자로 어떤 그룹에도 속하지 않음  
-   
- \# 복잡한 디렉터리 구조 생성  
- mkdir \-p {company/{departments/{dev,hr,finance,marketing},projects/{project\_a,project\_b,project\_c}},shared/{documents,resources,tools},private/{alice,bob,charlie,diana,eve},backup/{daily,weekly,monthly},logs/{2023/{01..12},2024/{01..12}}}  
-   
- \# 다양한 파일 생성  
- touch company/departments/dev/{main.py,test.py,config.py,README.md}  
- touch company/departments/hr/{employees.xlsx,contracts.pdf,policies.txt}  
- touch company/departments/finance/{budget.xlsx,reports.pdf,invoices.csv}  
- touch company/projects/project\_a/{spec.doc,code.zip,data.json}  
- touch company/projects/project\_b/{requirements.txt,source.tar.gz,notes.md}  
- touch shared/documents/{manual.pdf,guidelines.txt,templates.docx}  
- touch shared/resources/{images.zip,fonts.tar,icons.png}  
- touch private/alice/{personal.txt,settings.conf,backup.tar}  
- touch private/bob/{notes.md,config.json,archive.zip}  
- touch backup/daily/{backup\_$(date \+%Y%m%d).tar.gz,log\_$(date \+%Y%m%d).txt}  
- touch logs/2024/06/{access.log,error.log,debug.log,system.log}  
-   
- \# 실행 가능한 스크립트 파일 생성  
- echo '\#\!/bin/bash' \> shared/tools/deploy.sh  
- echo 'echo "Deployment script"' \>\> shared/tools/deploy.sh  
- echo '\#\!/bin/bash' \> shared/tools/backup.sh  
- echo 'echo "Backup script"' \>\> shared/tools/backup.sh  
- echo '\#\!/bin/bash' \> company/departments/dev/build.sh  
- echo 'echo "Build script"' \>\> company/departments/dev/build.sh  
-   
- \# 설정 파일 생성  
- echo "database\_host=localhost" \> company/departments/dev/database.conf  
- echo "api\_key=secret123" \> company/departments/dev/api.conf  
- echo "salary\_data=confidential" \> company/departments/hr/salaries.txt  
-   
- echo "실습 환경이 구성되었습니다\!"  
- tree permission\_practice  
    
  ---

  ## **1\. 기본 권한 설정**

  ### **1-1. 개발팀 파일 권한 설정**

개발팀(developers 그룹) 관련 파일들의 권한을 다음과 같이 설정하세요:

* `company/departments/dev/` 디렉터리: 개발팀만 접근 가능, 소유자와 그룹은 읽기/쓰기/실행 가능  
* `company/departments/dev/main.py`: 개발팀은 읽기/쓰기, 기타는 읽기만 가능  
* `company/departments/dev/build.sh`: 개발팀만 실행 가능

**명령어를 작성하세요:**

- \# 1-1 답안 작성란 
``` 
[root@localhost permission_practice]# chown alice company/departments/dev/ && \
[root@localhost permission_practice]# chgrp developers company/departments/dev/ && \
[root@localhost permission_practice]# chmod u=rwx company/departments/dev/ && \
[root@localhost permission_practice]# chmod g=rwx company/departments/dev/

[root@localhost permission_practice]# chmod g=rw company/departments/dev/main.py && \
[root@localhost permission_practice]# chmod o=r company/departments/dev/main.py

[root@localhost permission_practice]# chmod g=rx company/departments/dev/build.sh 

[alice@localhost permission_practice]$ ./company/departments/dev/build.sh
Build script



```
- 


  ### **1-2. 개인 디렉터리 보안 설정**

각 사용자의 개인 디렉터리와 파일을 다음과 같이 설정하세요:

* `private/alice/` 디렉터리: alice만 접근 가능  
* `private/alice/personal.txt`: alice만 읽기/쓰기 가능  
* `private/bob/config.json`: bob만 읽기/쓰기 가능

**명령어를 작성하세요:**

- \# 1-2 답안 작성란  
 ```
[root@localhost permission_practice]# chown alice private/alice/

[root@localhost permission_practice]# chmod u=rw private/alice/personal.txt && \
[root@localhost permission_practice]# chmod g=- private/alice/personal.txt && \
[root@localhost permission_practice]# chmod o=- private/alice/personal.txt

[root@localhost permission_practice]# chown bob private/bob/config.json && \
[root@localhost permission_practice]# chmod g=- private/bob/config.json && \
[root@localhost permission_practice]# chmod o=- private/bob/config.json && \
[root@localhost permission_practice]# chmod u=rw private/bob/config.json 
```  
    
  ---

  ## **2\. 그룹 기반 권한 관리**

  ### **2-1. 공유 리소스 접근 권한**

`shared/` 디렉터리의 권한을 다음과 같이 설정하세요:

* `shared/documents/`: developers와 managers 그룹 모두 읽기 가능, 소유자만 쓰기 가능  
* `shared/resources/`: developers 그룹만 접근 가능  
* `shared/tools/`: 모든 사용자가 읽기 가능, developers 그룹만 실행 가능

**명령어를 작성하세요:**

- \# 2-1 답안 작성란  
 ```
 [root@localhost permission_practice]# chown alice shared/documents/ && \
[root@localhost permission_practice]# chgrp developers shared/documents/ && \
[root@localhost permission_practice]# chgrp managers shared/documents/ && \
[root@localhost permission_practice]# chmod g=r shared/documents/ && \
[root@localhost permission_practice]# chmod u=w shared/documents/

[root@localhost permission_practice]# chgrp developers shared/resources/

[root@localhost permission_practice]# chgrp developers shared/tools/ && \
[root@localhost permission_practice]# chown alice shared/tools/ && \
[root@localhost permission_practice]# chmod uo=r shared/tools/ && \
[root@localhost permission_practice]# chmod g=rx shared/tools/

```



  ### **2-2. 프로젝트별 협업 권한**

프로젝트 디렉터리의 권한을 다음과 같이 설정하세요:

* `company/projects/project_a/`: developers 그룹 구성원들이 협업할 수 있도록 설정  
* `company/projects/project_b/`: alice와 bob만 접근 가능하도록 설정

**명령어를 작성하세요:**

- \# 2-2 답안 작성란  
```
[root@localhost permission_practice]# chgrp developers company/projects/project_a/ && \
[root@localhost permission_practice]# chmod g=rwx company/projects/project_a/

[root@localhost permission_practice]# groupadd project_b
[root@localhost permission_practice]# usermod -aG project_b alice && \
usermod -aG project_b bob && \
[root@localhost permission_practice]# chown alice company/projects/project_b && \
[root@localhost permission_practice]# chgrp project_b company/projects/project_b && \
[root@localhost permission_practice]# chmod o=- company/projects/project_b
```
    
  ---

  ## **3\. 고급 권한 설정**

  ### **3-1. 특수 권한 적용**

다음 파일들에 특수 권한을 설정하세요:

* `shared/tools/deploy.sh`: SetGID 설정으로 developers 그룹 권한으로 실행   
* `company/departments/hr/salaries.txt`: SetUID 설정 (실제 환경에서는 권장하지 않지만 실습용)

**명령어를 작성하세요:**
```
[root@localhost permission_practice]# chgrp developers shared/tools/deploy.sh && \
[root@localhost permission_practice]# chmod g=s shared/tools/deploy.sh && \
[root@localhost permission_practice]# chmod g=s company/departments/hr/salaries.txt
```




  ### **3-2. 숫자 표기법으로 복합 권한 설정**

다음 파일들의 권한을 숫자 표기법으로 설정하세요:

* `company/departments/finance/budget.xlsx`: 소유자(rw-), 그룹(r--), 기타(---)  
* `shared/documents/manual.pdf`: 소유자(rw-), 그룹(r--), 기타(r--)  
* `logs/2024/06/system.log`: 소유자(rw-), 그룹(r--), 기타(---)

**명령어를 작성하세요:**
```
[root@localhost permission_practice]# chmod 640 company/departments/finance/budget.xlsx
[root@localhost permission_practice]# chmod 644 shared/documents/manual.pdf 
[root@localhost permission_practice]# chmod 640 logs/2024/06/system.log 
 ```
  
    
  ---

  ## **4\. 소유권 및 그룹 관리**

  ### **4-1. 소유권 변경**

다음과 같이 파일과 디렉터리의 소유권을 변경하세요:

* `company/departments/dev/` 디렉터리와 모든 하위 파일: alice 소유, developers 그룹  
* `company/departments/hr/` 디렉터리와 모든 하위 파일: diana 소유, managers 그룹  
* `shared/tools/` 디렉터리와 모든 하위 파일: root 소유, developers 그룹

**명령어를 작성하세요:**

- \# 4-1 답안 작성란  
```
[root@localhost permission_practice]# chown -R alice company/departments/dev/ && \
[root@localhost permission_practice]# chgrp -R developers company/departments/dev/

[root@localhost permission_practice]# chown -R diana company/departments/hr/ && \
[root@localhost permission_practice]# chgrp -R managers company/departments/hr/

[root@localhost permission_practice]# chown -R root shared/tools/ && \
[root@localhost permission_practice]# chgrp -R developers shared/tools/

``` 


  ### **4-2. 그룹 전용 변경**

다음 디렉터리들의 그룹만 변경하세요:

* `company/projects/`: managers 그룹으로 변경  
* `backup/daily/`: developers 그룹으로 변경

**명령어를 작성하세요:**

- \# 4-2 답안 작성란  
```
[root@localhost permission_practice]# chgrp managers company/projects/

[root@localhost permission_practice]# chgrp developers backup/daily/
```  
    
  ---
    
  ---


  ## **8\. 실행 권한 및 스크립트 관리**

  ### **8-1. 스크립트 실행 환경 설정**

다음 스크립트 파일들의 실행 권한을 적절히 설정하세요:

* `shared/tools/deploy.sh`: developers 그룹만 실행 가능  
* `shared/tools/backup.sh`: alice와 diana만 실행 가능 (ACL 사용)  
* `company/departments/dev/build.sh`: 소유자만 실행 가능

**명령어를 작성하세요:**

- \# 8-1 답안 작성란  
```
[root@localhost permission_practice]# chgrp developers shared/tools/deploy.sh && \
[root@localhost permission_practice]# chmod g=rx shared/tools/deploy.sh && \
[root@localhost permission_practice]# chmod uo=- shared/tools/deploy.sh 

`shared/tools/backup.sh`: alice와 diana만 실행 가능 (ACL 사용)

[root@localhost permission_practice]# chown alice company/departments/dev/build.sh && \
[root@localhost permission_practice]# chmod u=rx company/departments/dev/build.sh && \
[root@localhost permission_practice]# chmod go=- company/departments/dev/build.sh 

``` 


  ### **8-2. 시스템 스크립트 보안 설정**

시스템 관리용 스크립트를 다음과 같이 설정하세요:

* root 소유의 시스템 관리 스크립트 생성 (system\_check.sh)  
* 일반 사용자가 sudo 없이 실행할 수 있도록 SetUID 설정  
* 실행 로그를 남기도록 권한 설정

**명령어를 작성하세요:**

- \# 8-2 답안 작성란  
```
[root@localhost ~]# touch system_check.sh && \
[root@localhost ~]# ls -l system_check.sh 
-rw-r--r--. 1 root root 0 Jul 22 09:25 system_check.sh
[root@localhost ~]# 

[root@localhost ~]# chmod 755 system_check.sh && \
[root@localhost ~]# chmod u+s system_check.sh

[root@localhost ~]# touch permission_practice/logs/2024/07/system_check.log && \
[root@localhost ~]# chmod 600 permission_practice/logs/2024/07/system_check.log

```   
    
  ---

  ## **9\. 디렉터리별 접근 제어**

  ### **9-1. 계층적 접근 제어**

다음과 같은 계층적 접근 권한을 설정하세요:

* `company/` : 모든 직원이 읽기 가능  
* `company/departments/` : 각 부서원만 해당 부서 디렉터리 접근 가능  
* `company/departments/finance/` : managers 그룹만 접근 가능  
* `company/projects/` : 프로젝트 참여자만 해당 프로젝트 접근 가능

**명령어를 작성하세요:**

- \# 9-1 답안 작성란  
```
[root@localhost permission_practice]# chmod 744 ./company/

```


  ### **9-2. 임시 작업 공간 설정**

임시 작업을 위한 공간을 다음과 같이 설정하세요:

* `temp/` 디렉터리 생성 (모든 사용자가 파일 생성 가능)  
* Sticky Bit 설정으로 자신의 파일만 삭제 가능  
* 1주일 후 자동 삭제되도록 권한 설정 (cron 작업용)

**명령어를 작성하세요:**

- \# 9-2 답안 작성란  
```
mkdir ./temp && \
chmod 777 ./temp
``` 
    
  ---

  ## **10\. 백업 및 아카이브 권한 관리**

  ### **10-1. 백업 파일 보안**

백업 관련 파일들의 보안을 다음과 같이 설정하세요:

* `backup/daily/` : developers 그룹이 백업 생성 가능, 읽기 전용  
* `backup/weekly/` : managers만 접근 가능  
* `backup/monthly/` : root만 접근 가능  
* 모든 백업 파일은 생성 후 읽기 전용으로 자동 변경

**명령어를 작성하세요:**

- \# 10-1 답안 작성란  
```
chgrp developers ./backup/daily/ && \
chmod g=rwx ./backup/daily/

chgrp managers ./backup/weekly/ && \
chmod g=rwx ./backup/weekly/ && \
chmod o=- ./backup/weekly/

chown root ./backup/monthly/ && \
chmod o=- ./backup/monthly/ && \
chmod u=rwx ./backup/monthly/
```
    
  ---

  