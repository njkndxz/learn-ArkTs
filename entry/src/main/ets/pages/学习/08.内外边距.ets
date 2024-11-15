

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    // 使用space控制组件间的距离
    Column({ space: 20 }) {
      Row({ space: 5}) {
        Image($r('app.media.ic_gallery_create'))
          .width(20)
            // 用于修改svg图标的颜色
          .fillColor(Color.Gray)
        Text('开灯')
          .fontColor(Color.Gray)
      }
      .border({
        color: Color.Gray
      })
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