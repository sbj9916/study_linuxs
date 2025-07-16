#Quest

- 1-1. 현재 위치 확인 및 이동

[shinbeomjun@localhost ~]$ pwd
/home/shinbeomjun
[shinbeomjun@localhost ~]$ cd /home
[shinbeomjun@localhost home]$ cd /home/shinbeomjun

- 1-2. 디렉터리 내용 확인

[shinbeomjun@localhost ~]$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
[shinbeomjun@localhost ~]$ ls -l
total 0
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Desktop
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Documents
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Downloads
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Music
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Pictures
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Public
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Templates
drwxr-xr-x. 2 shinbeomjun shinbeomjun 6 Jul 16 10:53 Videos

- 2-1. 디렉터리 구조 생성

[shinbeomjun@localhost ~]$ mkdir practice
[shinbeomjun@localhost ~]$ cd /home/shinbeomjun/practice
[shinbeomjun@localhost practice]$ mkdir documents
[shinbeomjun@localhost practice]$ mkdir images
[shinbeomjun@localhost practice]$ mkdir backup
[shinbeomjun@localhost practice]$ cd /home/shinbeomjun/practice/documents
[shinbeomjun@localhost documents]$ mkdir reports
[shinbeomjun@localhost documents]$ mkdir notes
[shinbeomjun@localhost documents]$ cd /home/shinbeomjun/practice/documents/reports
[shinbeomjun@localhost reports]$ mkdir ls

-2-2. 파일 생성 및 내용 작성

[shinbeomjun@localhost reports]$ cd /home/shinbeomjun/practice/documents
[shinbeomjun@localhost documents]$ echo "Hello Linux" > readme.txt
[shinbeomjun@localhost documents]$ cd /home/shinbeomjun/practice/documents/notes
[shinbeomjun@localhost notes]$ echo "Linux 명령어 연습 중" > memo.txt

-3-1. 파일 내용 출력

[shinbeomjun@localhost notes]$ cat memo.txt
Linux 명령어 연습 중
[shinbeomjun@localhost notes]$ cd /home/shinbeomjun/practice/documents
[shinbeomjun@localhost documents]$ cat readme.txt
Hello Linux

-3-2. 파일 복사

[shinbeomjun@localhost documents]$ cd /home/shinbeomjun/practice
[shinbeomjun@localhost practice]$ cp -r documents /home/shinbeomjun/practice/backup
[shinbeomjun@localhost practice]$ cd /home/shinbeomjun/practice/documents
[shinbeomjun@localhost documents]$ cp readme.txt /home/shinbeomjun/practice/backup

-4-1. 파일 이동

[shinbeomjun@localhost backup]$ cd /home/shinbeomjun/practice/documents/notes
[shinbeomjun@localhost notes]$ mv memo.txt /home/shinbeomjun/practice/documents
[shinbeomjun@localhost notes]$ cd /home/shinbeomjun/practice
[shinbeomjun@localhost practice]$ mv images media

-4-2. 파일 이름 변경

[shinbeomjun@localhost practice]$ cd /home/shinbeomjun/practice/documents
[shinbeomjun@localhost documents]$ mv readme.txt introduction.txt
[shinbeomjun@localhost documents]$ mv memo.txt study_notes.txt

-5-1. 프로젝트 디렉터리 생성

[shinbeomjun@localhost documents]$ cd /home/shinbeomjun
[shinbeomjun@localhost ~]$ mkdir my_project
[shinbeomjun@localhost ~]$ cd /home/shinbeomjun/my_project
[shinbeomjun@localhost my_project]$ mkdir src
[shinbeomjun@localhost my_project]$ mkdir docs
[shinbeomjun@localhost my_project]$ mkdir tests
[shinbeomjun@localhost my_project]$ mkdir config
[shinbeomjun@localhost docs]$ cd /home/shinbeomjun/my_project/src
[shinbeomjun@localhost src]$ echo "# Main Python File" > main.py
[shinbeomjun@localhost docs]$ cd /home/shinbeomjun/my_project/docs
[shinbeomjun@localhost docs]$ echo "# My Project Documentation" > README.md
[shinbeomjun@localhost src]$ cd /home/shinbeomjun/my_project/config
[shinbeomjun@localhost config]$ echo "# Configuration File" > settings.conf

-5-2. 백업 및 정리

[shinbeomjun@localhost ~]$ cp -r my_project /home/shinbeomjun/my_project_backup
[shinbeomjun@localhost ~]$ cd /home/shinbeomjun/my_project/src
[shinbeomjun@localhost src]$ mv main.py app.py
[shinbeomjun@localhost src]$ cd /home/shinbeomjun/my_project/docs
[shinbeomjun@localhost docs]$ mv README.md /home/shinbeomjun/my_project

-6 결과물
[shinbeomjun@localhost ~]$ tree
.
├── Desktop
├── Documents
├── Downloads
├── Music
├── my_project
│   ├── config
│   │   └── settings.conf
│   ├── docs
│   ├── README.md
│   ├── src
│   │   └── app.py
│   └── tests
├── my_project_backup
│   └── my_project
│       ├── config
│       │   └── settings.conf
│       ├── docs
│       │   └── README.md
│       ├── src
│       │   └── main.py
│       └── tests
├── Pictures
├── practice
│   ├── backup
│   │   ├── documents
│   │   │   ├── notes
│   │   │   │   └── memo.txt
│   │   │   ├── readme.txt
│   │   │   └── reports
│   │   │       └── ls
│   │   └── readme.txt
│   ├── documents
│   │   ├── introduction.txt
│   │   ├── notes
│   │   ├── reports
│   │   │   └── ls
│   │   └── study_notes.txt
│   └── media
├── Public
├── Templates
└── Videos

