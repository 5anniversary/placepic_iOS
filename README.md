# placepic_iOS

###  CODE CONVENTION 🐷

<br />
<br />


## 💡 네이밍 

- **함수**

  -> 함수 이름은 lowerCamelCase를 사용한다

  -> 함수이름은 동사로 시작한다 ex) `setNavigationBar()`

- **변수**

  -> 변수 이름은 lowerCamelCase를 사용한다

- **상수**

  -> 상수 이름에는 lowerCamelCase를 사용한다


<br />
<br />


## 💡 약어

-> 약어는 대문자로 표현한다 ex) userID

- ViewController => **VC**

- TableViewController => **TV**


- TableViewCell => **TVC**

<br />
<br />


## 💡 기타 규칙

- self -> 최대한 사용하지 않기

- 함수는 extension에 최대한 정리한다.

-  `viewDidLoad()` 에는 함수호출만 하도록 한다.

- `//MARK:` 를 사용해서 연관된 코드를 구분짓습니다.


- [ ```
└── placepic
    ├── Pods
    │   ├── Alamofire
    │   │   └── Source
    │   ├── Firebase
    │   │   └── CoreOnly
    │   │       └── Sources
    │   ├── FirebaseAnalytics
    │   │   └── Frameworks
    │   │       ├── FIRAnalyticsConnector.framework
    │   │       │   └── Modules
    │   │       └── FirebaseAnalytics.framework
    │   │           ├── Headers
    │   │           └── Modules
    │   ├── FirebaseCore
    │   │   ├── Firebase
    │   │   ├── FirebaseCore
    │   │   │   └── Sources
    │   │   │       ├── Private
    │   │   │       └── Public
    │   │   └── Interop
    │   │       └── CoreDiagnostics
    │   │           └── Public
    │   ├── FirebaseCoreDiagnostics
    │   │   ├── Firebase
    │   │   │   └── CoreDiagnostics
    │   │   │       └── FIRCDLibrary
    │   │   │           └── Protogen
    │   │   │               └── nanopb
    │   │   └── Interop
    │   │       └── CoreDiagnostics
    │   │           └── Public
    │   ├── FirebaseInstallations
    │   │   ├── Firebase
    │   │   ├── FirebaseCore
    │   │   │   └── Sources
    │   │   │       └── Private
    │   │   └── FirebaseInstallations
    │   │       └── Source
    │   │           └── Library
    │   │               ├── Errors
    │   │               ├── IIDMigration
    │   │               ├── InstallationsAPI
    │   │               ├── InstallationsIDController
    │   │               ├── InstallationsStore
    │   │               └── Public
    │   ├── GoogleAppMeasurement
    │   │   └── Frameworks
    │   │       └── GoogleAppMeasurement.framework
    │   │           └── Modules
    │   ├── GoogleDataTransport
    │   │   └── GoogleDataTransport
    │   │       └── GDTCORLibrary
    │   │           ├── Private
    │   │           └── Public
    │   ├── GoogleDataTransportCCTSupport
    │   │   ├── GoogleDataTransport
    │   │   └── GoogleDataTransportCCTSupport
    │   │       └── GDTCCTLibrary
    │   │           ├── Private
    │   │           ├── Protogen
    │   │           │   └── nanopb
    │   │           └── Public
    │   ├── GoogleUtilities
    │   │   └── GoogleUtilities
    │   │       ├── AppDelegateSwizzler
    │   │       │   ├── Internal
    │   │       │   └── Private
    │   │       ├── Common
    │   │       ├── Environment
    │   │       │   ├── Public
    │   │       │   ├── SecureStorage
    │   │       │   └── third_party
    │   │       ├── Logger
    │   │       │   ├── Private
    │   │       │   └── Public
    │   │       ├── MethodSwizzler
    │   │       │   └── Private
    │   │       ├── NSData+zlib
    │   │       ├── Network
    │   │       │   └── Private
    │   │       ├── Reachability
    │   │       │   └── Private
    │   │       ├── SceneDelegateSwizzler
    │   │       │   ├── Internal
    │   │       │   └── Private
    │   │       └── UserDefaults
    │   │           └── Private
    │   ├── Headers
    │   │   ├── Private
    │   │   │   └── Firebase
    │   │   └── Public
    │   │       └── Firebase
    │   ├── Kingfisher
    │   │   └── Sources
    │   │       ├── Cache
    │   │       ├── Extensions
    │   │       ├── General
    │   │       │   └── ImageSource
    │   │       ├── Image
    │   │       ├── Networking
    │   │       ├── Utility
    │   │       └── Views
    │   ├── Local\ Podspecs
    │   ├── NMapsMap
    │   │   └── framework
    │   │       └── NMapsMap.framework
    │   │           ├── Base.lproj
    │   │           ├── Headers
    │   │           ├── Modules
    │   │           ├── NMFIndoorLevelPickerCell.nib
    │   │           ├── NMFIndoorLevelPickerView.nib
    │   │           ├── NMFNaverMapView.nib
    │   │           ├── en.lproj
    │   │           ├── ja.lproj
    │   │           ├── ko.lproj
    │   │           └── zh-Hans.lproj
    │   ├── Pods.xcodeproj
    │   │   └── xcuserdata
    │   │       └── leeyujin.xcuserdatad
    │   │           └── xcschemes
    │   ├── PromisesObjC
    │   │   └── Sources
    │   │       └── FBLPromises
    │   │           └── include
    │   ├── PryntTrimmerView
    │   │   └── PryntTrimmerView
    │   │       └── Classes
    │   │           ├── Cropper
    │   │           ├── Parents
    │   │           └── Trimmer
    │   ├── SteviaLayout
    │   │   └── Source
    │   ├── SwiftKeychainWrapper
    │   │   └── SwiftKeychainWrapper
    │   ├── Target\ Support\ Files
    │   │   ├── Alamofire
    │   │   ├── Firebase
    │   │   ├── FirebaseAnalytics
    │   │   ├── FirebaseCore
    │   │   ├── FirebaseCoreDiagnostics
    │   │   ├── FirebaseInstallations
    │   │   ├── GoogleAppMeasurement
    │   │   ├── GoogleDataTransport
    │   │   ├── GoogleDataTransportCCTSupport
    │   │   ├── GoogleUtilities
    │   │   ├── Kingfisher
    │   │   ├── NMapsMap
    │   │   ├── Pods-placepic
    │   │   ├── PromisesObjC
    │   │   ├── PryntTrimmerView
    │   │   ├── SteviaLayout
    │   │   ├── SwiftKeychainWrapper
    │   │   ├── XLPagerTabStrip
    │   │   ├── YPImagePicker
    │   │   ├── lottie-ios
    │   │   └── nanopb
    │   ├── XLPagerTabStrip
    │   │   └── Sources
    │   ├── YPImagePicker
    │   │   ├── Resources
    │   │   │   ├── Assets.xcassets
    │   │   │   │   ├── yp_arrow_down.imageset
    │   │   │   │   ├── yp_arrow_left.imageset
    │   │   │   │   ├── yp_iconCapture.imageset
    │   │   │   │   ├── yp_iconCrop.imageset
    │   │   │   │   ├── yp_iconFlash_auto.imageset
    │   │   │   │   ├── yp_iconFlash_off.imageset
    │   │   │   │   ├── yp_iconFlash_on.imageset
    │   │   │   │   ├── yp_iconLoop.imageset
    │   │   │   │   ├── yp_iconVideoCapture.imageset
    │   │   │   │   ├── yp_iconVideoCaptureRecording.imageset
    │   │   │   │   ├── yp_multiple.imageset
    │   │   │   │   ├── yp_multiple_colored.imageset
    │   │   │   │   ├── yp_play.imageset
    │   │   │   │   └── yp_remove.imageset
    │   │   │   ├── ar.lproj
    │   │   │   ├── bg.lproj
    │   │   │   ├── de.lproj
    │   │   │   ├── en.lproj
    │   │   │   ├── es.lproj
    │   │   │   ├── fr.lproj
    │   │   │   ├── id.lproj
    │   │   │   ├── it.lproj
    │   │   │   ├── ja.lproj
    │   │   │   ├── ko.lproj
    │   │   │   ├── nl.lproj
    │   │   │   ├── pt-BR.lproj
    │   │   │   ├── pt-PT.lproj
    │   │   │   ├── ru.lproj
    │   │   │   ├── th.lproj
    │   │   │   ├── tr.lproj
    │   │   │   ├── vi.lproj
    │   │   │   ├── zh-Hans.lproj
    │   │   │   └── zh-Hant.lproj
    │   │   └── Source
    │   │       ├── Configuration
    │   │       ├── Filters
    │   │       │   ├── Crop
    │   │       │   └── Video
    │   │       ├── Helpers
    │   │       │   └── Extensions
    │   │       ├── Models
    │   │       ├── Pages
    │   │       │   ├── Gallery
    │   │       │   │   └── BottomPager
    │   │       │   ├── Photo
    │   │       │   └── Video
    │   │       └── SelectionsGallery
    │   ├── lottie-ios
    │   │   ├── Lottie
    │   │   └── lottie-swift
    │   │       └── src
    │   │           ├── Private
    │   │           │   ├── LayerContainers
    │   │           │   │   ├── CompLayers
    │   │           │   │   └── Utility
    │   │           │   ├── Model
    │   │           │   │   ├── Assets
    │   │           │   │   ├── Extensions
    │   │           │   │   ├── Keyframes
    │   │           │   │   ├── Layers
    │   │           │   │   ├── Objects
    │   │           │   │   ├── ShapeItems
    │   │           │   │   └── Text
    │   │           │   ├── NodeRenderSystem
    │   │           │   │   ├── Extensions
    │   │           │   │   ├── NodeProperties
    │   │           │   │   │   ├── Protocols
    │   │           │   │   │   └── ValueProviders
    │   │           │   │   ├── Nodes
    │   │           │   │   │   ├── ModifierNodes
    │   │           │   │   │   ├── OutputNodes
    │   │           │   │   │   │   └── Renderables
    │   │           │   │   │   ├── PathNodes
    │   │           │   │   │   ├── RenderContainers
    │   │           │   │   │   ├── RenderNodes
    │   │           │   │   │   └── Text
    │   │           │   │   ├── Protocols
    │   │           │   │   └── RenderLayers
    │   │           │   └── Utility
    │   │           │       ├── Debugging
    │   │           │       ├── Extensions
    │   │           │       ├── Helpers
    │   │           │       ├── Interpolatable
    │   │           │       └── Primitives
    │   │           └── Public
    │   │               ├── Animation
    │   │               ├── AnimationCache
    │   │               ├── DynamicProperties
    │   │               │   └── ValueProviders
    │   │               ├── ImageProvider
    │   │               ├── Primitives
    │   │               ├── TextProvider
    │   │               └── iOS
    │   │                   └── Compatibility
    │   └── nanopb
    ├── placepic
    │   ├── Extension
    │   ├── HomeScene
    │   │   ├── Model
    │   │   │   └── SwiftFiles
    │   │   └── View
    │   │       ├── Cell
    │   │       └── VC
    │   ├── LoginScene
    │   │   ├── Base.lproj
    │   │   └── View
    │   │       ├── Cell
    │   │       └── VC
    │   ├── MypageScene
    │   │   ├── Model
    │   │   └── View
    │   │       └── VC
    │   ├── RankScene
    │   │   └── View
    │   │       └── VC
    │   ├── SearchScene
    │   │   └── View
    │   │       └── VC
    │   ├── Support
    │   │   ├── Assets.xcassets
    │   │   │   ├── AppIcon.appiconset
    │   │   │   ├── backArrowIc.imageset
    │   │   │   ├── cameraIc.imageset
    │   │   │   ├── closeIc.imageset
    │   │   │   ├── doneIc.imageset
    │   │   │   ├── downArrowIc.imageset
    │   │   │   ├── errorIc.imageset
    │   │   │   ├── groupIc.imageset
    │   │   │   ├── homeSelectedIc.imageset
    │   │   │   ├── homeUnselectedIc.imageset
    │   │   │   ├── icStation1.imageset
    │   │   │   ├── icStation2.imageset
    │   │   │   ├── icStation3.imageset
    │   │   │   ├── icStation4.imageset
    │   │   │   ├── icStation5.imageset
    │   │   │   ├── icStation6.imageset
    │   │   │   ├── icStation7.imageset
    │   │   │   ├── icStation8.imageset
    │   │   │   ├── icStation9.imageset
    │   │   │   ├── icStationAirport.imageset
    │   │   │   ├── icStationBundang.imageset
    │   │   │   ├── icStationBusang.imageset
    │   │   │   ├── icStationEast.imageset
    │   │   │   ├── icStationEverline.imageset
    │   │   │   ├── icStationGyeongUijungAng.imageset
    │   │   │   ├── icStationGyeongchun.imageset
    │   │   │   ├── icStationGyeonggang.imageset
    │   │   │   ├── icStationIncheon1.imageset
    │   │   │   ├── icStationIncheon2.imageset
    │   │   │   ├── icStationKimpho.imageset
    │   │   │   ├── icStationSinbundang.imageset
    │   │   │   ├── icStationSuin.imageset
    │   │   │   ├── icStationUijeongbu.imageset
    │   │   │   ├── icStationUisinseol.imageset
    │   │   │   ├── icStationWest.imageset
    │   │   │   ├── nextArrowIc.imageset
    │   │   │   ├── notificationsNoneIc.imageset
    │   │   │   ├── notificationsNoticeIc.imageset
    │   │   │   ├── placepicBlackIc.imageset
    │   │   │   ├── placepicIc.imageset
    │   │   │   ├── placepicMainColorIc.imageset
    │   │   │   ├── rankingSelectedIc.imageset
    │   │   │   ├── rankingUnselectedIc.imageset
    │   │   │   ├── searchBarIc.imageset
    │   │   │   ├── searchSelectedIc.imageset
    │   │   │   ├── searchUnselectedIc.imageset
    │   │   │   ├── smallCloseIc.imageset
    │   │   │   ├── subwayIc.imageset
    │   │   │   ├── userSelectedIc.imageset
    │   │   │   ├── userUnselectedIc.imageset
    │   │   │   ├── whiteBackArrowIc.imageset
    │   │   │   ├── whiteCameraIc.imageset
    │   │   │   ├── whiteCloseIc.imageset
    │   │   │   ├── whiteDownArrowIc.imageset
    │   │   │   ├── whiteHomeSelectedIc.imageset
    │   │   │   ├── whiteNextArrowIc.imageset
    │   │   │   ├── whiteNotificationsNoneIc.imageset
    │   │   │   ├── whiteNotificationsNoticeIc.imageset
    │   │   │   ├── whitePlacepicIc.imageset
    │   │   │   ├── whiteRankingSelectedIc.imageset
    │   │   │   ├── whiteSearchSelectedIc.imageset
    │   │   │   ├── whiteSmallCloseIc.imageset
    │   │   │   ├── whiteUserSelectedIc.imageset
    │   │   │   ├── whiteWriteSelectedIc.imageset
    │   │   │   ├── writeSelectedIc.imageset
    │   │   │   └── writeUnselectedIc.imageset
    │   │   ├── Base.lproj
    │   │   └── Font
    │   ├── TabbarScene
    │   │   └── VC
    │   └── WriteScene
    │       └── View
    │           └── VC
    ├── placepic.xcodeproj
    │   ├── project.xcworkspace
    │   │   └── xcshareddata
    │   └── xcuserdata
    │       └── leeyujin.xcuserdatad
    │           └── xcschemes
    └── placepic.xcworkspace
        ├── xcshareddata
        └── xcuserdata
            └── leeyujin.xcuserdatad
                └── xcdebugger

366 directories
```]
