# swift-mvvm-sample

## Repository 목적
1. MVVM 이 무엇인지 대해서, README를 통해 기술합니다.
2. mvvm design pattern을 도입한 swift기반의 ios sample project를 작성합니다.
3. mvvm design pattern 하에서, unittest sample을 작성합니다. 

## MVVM?
> MVVM은 Model-View-ViewModel 3개의 component로 이루어진 Design Pattern이다. 
> MVVM에서의 ViewModel은 View와 Model 가운데서, 둘을 연결하며, Event Stream을 노출하여 그것을 View가 Binding하여 사용 할수 있게끔 제공 함으로써 Application Logic을 ViewConrtroller(MVC Pattern에서의) 분리 시킬수 있게 도와준다. 

참고자료 : http://lukagabric.com/mvvm-design-pattern-and-rxswift/

## Sample project에 대한 간단한 설명
1. package management로 cocoapods르 사용합니다.
2. RxBlocking을 이용한 ViewModel UnitTest.
