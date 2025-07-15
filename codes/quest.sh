#quest
-
```shell
PS C:\> cd C:\Develops\powershell_practice\quests
PS C:\Develops\powershell_practice\quests> ls
PS C:\Develops\powershell_practice\quests> mkdir documents


    디렉터리: C:\Develops\powershell_practice\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:35                documents


PS C:\Develops\powershell_practice\quests> mkdir images


    디렉터리: C:\Develops\powershell_practice\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:35                images


PS C:\Develops\powershell_practice\quests> mkdir backup


    디렉터리: C:\Develops\powershell_practice\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:36                backup


PS C:\Develops\powershell_practice\quests> mkdir temp


    디렉터리: C:\Develops\powershell_practice\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:36                temp

PS C:\Develops\powershell_practice\quests> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.
├─backup
├─documents
├─images
└─temp
PS C:\Develops\powershell_practice\quests> cd C:\Develops\powershell_practice\quests\documents
PS C:\Develops\powershell_practice\quests\documents> ls
PS C:\Develops\powershell_practice\quests\documents> cd C:\Develops\powershell_practice\quests
PS C:\Develops\powershell_practice\quests> cd C:\Develops\powershell_practice\quests\documents
PS C:\Develops\powershell_practice\quests\documents> "Hello PowerShell!"> hello.txt
PS C:\Develops\powershell_practice\quests\documents> ls


    디렉터리: C:\Develops\powershell_practice\quests\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:41             40 hello.txt


PS C:\Develops\powershell_practice\quests\documents> cp hello.txt C:\Develops\powershell_practice\quests\backup
PS C:\Develops\powershell_practice\quests\documents> cd C:\Develops\powershell_practice\quests\temp
PS C:\Develops\powershell_practice\quests\temp> "" > test.txt
PS C:\Develops\powershell_practice\quests\temp> mv test.txt C:\Develops\questspowershell_practice\\documents
PS C:\Develops\powershell_practice\quests\temp> cd C:\Develops\powershell_practice\quests\documents
PS C:\Develops\powershell_practice\quests\documents> rm test.txt
PS C:\Develops\powershell_practice\quests\documents> cd C:\Develops\powershell_practice\quests
PS C:\Develops\powershell_practice\quests> rm temp
PS C:\Develops\powershell_practice\quests> rm backup

확인
C:\Develops\powershell_practice\quests\backup의 항목에는 하위 항목이 있으며 Recurse 매개 변수를 지정하지 않았습니다. 계속하면 해당
항목과 모든 하위 항목이 제거됩니다. 계속하시겠습니까?
[Y] 예(Y)  [A] 모두 예(A)  [N] 아니요(N)  [L] 모두 아니요(L)  [S] 일시 중단(S)  [?] 도움말 (기본값은 "Y"): y

PS C:\Develops\quests> cd C:\Develops\quests\powershell_practice
PS C:\Develops\quests\powershell_practice> mkdir my_project


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:17                my_project


PS C:\Develops\quests\powershell_practice> cd C:\Develops\quests\powershell_practice\my_project
PS C:\Develops\quests\powershell_practice\my_project> mkdir src


    디렉터리: C:\Develops\quests\powershell_practice\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:17                src


PS C:\Develops\quests\powershell_practice\my_project> mkdir docs


    디렉터리: C:\Develops\quests\powershell_practice\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:17                docs


PS C:\Develops\quests\powershell_practice\my_project> mkdir tests


    디렉터리: C:\Develops\quests\powershell_practice\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:17                tests


PS C:\Develops\quests\powershell_practice\my_project> mkdir build


    디렉터리: C:\Develops\quests\powershell_practice\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:18                build


PS C:\Develops\quests\powershell_practice\my_project> ls


    디렉터리: C:\Develops\quests\powershell_practice\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:18                build
d-----      2025-07-15   오후 4:17                docs
d-----      2025-07-15   오후 4:17                src
d-----      2025-07-15   오후 4:17                tests


PS C:\Develops\quests\powershell_practice\my_project> cd C:\Develops\quests\powershell_practice\my_project\src
PS C:\Develops\quests\powershell_practice\my_project\src> "print(Hello World)" > main.py
PS C:\Develops\quests\powershell_practice\my_project\src> cd C:\Develops\quests\powershell_practice\my_project\docs
PS C:\Develops\quests\powershell_practice\my_project\docs> "This is my projct" > readme.txt
PS C:\Develops\quests\powershell_practice\my_project\docs> cp readme.txt C:\Develops\quests\powershell_practice\my_project\build
PS C:\Develops\quests\powershell_practice\my_project\docs> cd C:\Develops\quests\powershell_practice\my_project\src
PS C:\Develops\quests\powershell_practice\my_project\src> cp main.py C:\Develops\quests\powershell_practice\my_project\build
PS C:\Develops\quests\powershell_practice\my_project\src> cd C:\Develops\quests\powershell_practice\my_project
PS C:\Develops\quests\powershell_practice\my_project> rm tests
PS C:\Develops\quests\powershell_practice\my_project> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.
├─build
├─docs
└─src
PS C:\Develops\quests\powershell_practice\my_project> cd C:\Develops\quests\powershell_practice\my_project\build

PS C:\Develops\quests\powershell_practice\my_project\build> ls


    디렉터리: C:\Develops\quests\powershell_practice\my_project\build


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:20             42 main.py


PS C:\Develops\quests\powershell_practice\my_project\build> cd C:\Develops\quests\powershell_practice\my_project\docs
PS C:\Develops\quests\powershell_practice\my_project\docs> ls


    디렉터리: C:\Develops\quests\powershell_practice\my_project\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:21             40 readme.txt


PS C:\Develops\quests\powershell_practice\my_project\docs> cd C:\Develops\quests\powershell_practice\my_project\src
PS C:\Develops\quests\powershell_practice\my_project\src> ls


    디렉터리: C:\Develops\quests\powershell_practice\my_project\src


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:20             42 main.py
```