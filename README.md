# DoubleTap2Like

- 개발 언어: Swift 
- XCode: 13.2.1 
- 최소버전: iOS 15 
- 오픈소스 사용 유무: X

---

- SwiftUI
- MVVM 디자인 패턴을 사용한 확장 가능한 설계
- Combine 


### 테스트 환경

- iOS Simulators : iPhone 12 Pro
- Test Device : iPhone 12 mini
- PC : MacBook Pro 2017 (OS 11.6)

---

## 세부 설명

<img src="/Users/pang/Library/Application Support/typora-user-images/image-20220127230035310.png" alt="image-20220127230035310" style="zoom: 50%;" />

- https://picsum.photos/ 에서 제공되는 List Images API 를 사용하여 이미지 목록을 구현하였습니다.
- 확장 가능한 설계를 위하여 MVVM 패턴을 적용하여 개발을 진행하였습니다.
- 좌우로 페이지가 넘어가도록 페이징 처리를 진행했습니다. 
- iOS 15 부터 제공하는 AsyncImage 를 사용하여 구현하였습니다.
  - 테스트 도중 AsyncImage가 이미지 캐싱을 하고 있지 않다는 것을 발견했습니다.
  - CacheAsyncImage를 만들어 이미지 캐싱 처리를 해주었습니다.
- 화면을 두번 탭할 경우, 화면에 하트가 나타났다가 사라집니다.

---

### 프로젝트를 진행하면서

이미지 목록 api를 사용해서 프로젝트를 진행하면서, 노트와 Figma를 사용하여 어떤 앱을 만들까하는 고민을 했습니다. 
가장 먼저 떠올린 서비스는 '인스타그램' 이였습니다. 하지만, 이미지 목록의 사진들을 보면서 전체 화면에 맞게 사진을 보여주는 서비스를 만들어야겠다고 결정하게 되었습니다. 
사용경험과 우대 사항을 이유로 SwiftUI를 선택하였고, MVVM 패턴을 적용하고 Combine을 사용하였습니다.
인스타그램의 '좋아요'의 느낌을 위해서 더블탭 기능을 구현하였고, 가장 중요한 이미지를 불러오는 부분을 위해서 이미지 캐싱에 대해 
공부하면서 구현하였습니다. 사용자 경험을 위해 런치 스크린에 간단하면서 서비스를 소개하는 'Double Tap To Like'라는 설명을 넣었습니다.

지금까지 진행했던 프로젝트에서는 단독으로 iOS 개발을 진행해서, 코드의 품질을 신경쓰기보단 결과물을 만드는 데 집중했던 것 같습니다. 
이번 프로젝트를 진행하면서, 디자인 패턴에 맞게 구조를 짜고 더 나은 성능을 위해 고민해보는 경험을 했습니다.
테스트 코드와 클린 아키텍쳐에 대한 부분은 수행하지 못했지만, 더 열심히 학습하여 성장하는 iOS 개발자가 되겠습니다!

