

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    // 使用space控制组件间的距离
    Column({ space: 20 }) {
      Image($r('app.media.ic_gallery_create'))
        .width(50)
          // 用于修改svg图标的颜色
        .fillColor(Color.Red)
    }
    .padding(20)
  }
}