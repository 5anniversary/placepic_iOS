# placepic_iOS


<img style="border: 1px solid black !important; border-radius:20px;" src="https://avatars2.githubusercontent.com/u/67547341?s=200&v=4" width="200px" />

![placepic_badge](https://img.shields.io/badge/placepic-Sprint1-%23ff7adc)
![pod_bedge](https://img.shields.io/badge/pod-v1.9.1-blue) ![Swift_badge](https://img.shields.io/badge/Swift-5.0-orange.svg)



* <b> SOPT 26th APPJAM </b>

* 프로젝트 기간: 2020.06.28 ~ 2020.07.18



## 🐷placepic service

 <b>우리들끼리 공유하는 최애 장소, 플레이스픽 </b>

 플레이스픽은 신뢰있는 커뮤니티 기반의 장소 정보 공유 플랫폼입니다. 

 Service key Feature

  * Exploration - 쉽고, 빠르게 원하는 장소를 탐색

  * Discovery -  가보고 싶은 장소를 발견할 수 있어야함

  * Interaction - 상호작용, 소통할 수 있는 공간



## 🐷Core value

### App Jam Goal

* 우리가 쓸 수 있고, 쓰고 싶은 서비스를 만들어낼 것이다.

### 우리가 추구하는 가치

* 사용자 경험에 대한 집착 

* 자기주도성

* 린 스타트업 정신

* PRIDE

  

## 🐷Code Convention


### 💡 네이밍 

- **함수**

  함수 이름은 lowerCamelCase를 사용한다

  함수이름은 동사로 시작한다 ex) `setNavigationBar()`

- **변수**

  변수 이름은 lowerCamelCase를 사용한다

- **상수**

  상수 이름에는 lowerCamelCase를 사용한다

<br />
<br />

### 💡 약어

- 약어는 대문자로 표현한다 ex) userID

  `ViewController` => **VC**

  `TableViewController` => **TV**

  `TableViewCell` => **TVC**

<br />
<br />


### 💡 기타 규칙


- self -> 최대한 사용하지 않기

- 함수는 extension에 최대한 정리한다.

- `viewDidLoad()` 에는 함수호출만 하도록 한다.

- `//MARK:` 를 사용해서 연관된 코드를 구분짓습니다.

<br />
<br />

### 💡 git 

- git branch

  ```
  master
  |-- develop
    |-- feature/Login
    |-- feature/Home
    |-- feature/PlaceList
    |-- feature/MyPage
  ```
-  git commit message rule

  ```
   [Feat] 기능 추가
   [Fix] 버그 수정
   [Refactor] 리팩토링
   [Chore] 간단한 수정
   [Delete] 기능 삭제
   [Docs] 문서
   [Merge] 머지
  ```



## 🐷Foldering

```
placepic
├── Extension
├── HomeScene
│   ├── Home.storyboard
│   ├── Model
│   └── View
├── LoginScene
│   └── View
├── MypageScene
│   ├── Model
│   ├── Mypage.storyboard
│   └── View
├── RankScene
│   ├── Rank.storyboard
│   └── View
├── SearchScene
│   ├── Search.storyboard
│   ├── SubwayTVC.swift
│   └── View
├── Support
│   ├── Assets.xcassets
│   ├── Font
│   └── Info.plist
├── TabbarScene
│   ├── Tabbar.storyboard
│   └── VC
└── WriteScene
    ├── View
    └── Write.storyboard

22 directories, 17 files
```
