

@Entry
@Component
struct Index {
  @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    Column() {
      Text('小说简介')
        .width('100%')
        .height(40)
        .textAlign(TextAlign.Center)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row() {
        Text('都市')
          .width(50)
        Text('生活')
          .width(50)
        Text('科技')
          .width(50)
        Text('抽象')
          .width(50)
      }
      .width('100%')
      .height(30)
    }
    .width('100%')
    .backgroundColor(Color.Pink)
  }
}