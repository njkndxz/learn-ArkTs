

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    // 使用space控制组件间的距离
    Column({ space: 20 }) {
      Text('我是内容文本')
        .fontColor(Color.Transparent)
        .width(200)
        .height(100)
        .backgroundColor(Color.Pink)
        .backgroundImage($r('app.media.startIcon'), ImageRepeat.XY)
        // .backgroundImagePosition(Alignment.Center) vp2px可以将vp转成px 默认是vp
        .backgroundImagePosition({
          x: vp2px(50),
          y: vp2px(50)})
        // Contain: 等比例缩放至宽高相同 Cover: 等比例缩放至完全覆盖 Auto 默认
        .backgroundImageSize(ImageSize.Cover)
        // .backgroundImageSize({
        //   width: 100,
        //   height: 100
        // })
    }
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