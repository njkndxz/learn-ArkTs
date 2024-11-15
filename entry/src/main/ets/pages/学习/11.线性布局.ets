

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    // 使用space控制组件间的距离
    Column({ space: 20 }) {
      Text()
        .width(200)
        .height(100)
        .backgroundColor(Color.Pink)
      Text()
        .width(200)
        .height(100)
        .backgroundColor(Color.Pink)
      Text()
        .width(200)
        .height(100)
        .backgroundColor(Color.Pink)
      Text()
        .width(200)
        .height(100)
        .backgroundColor(Color.Pink)
      Row() {
        Text()
          .width(200)
          .height(100)
          .backgroundColor(Color.Pink)
        Text()
          .width(200)
          .height(100)
          .backgroundColor(Color.Pink)
      }
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height('100%')
    // 和flex布局一样
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(HorizontalAlign.Center)
    .padding({
      right: 20,
      left: 20
    })
    .margin({
      right: 20,
      left: 20
    })
  }
}