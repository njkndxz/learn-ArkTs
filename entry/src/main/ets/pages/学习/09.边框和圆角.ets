

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    // 使用space控制组件间的距离
    Column({ space: 20 }) {
      Text('VIP')
        .fontColor(Color.Yellow)
        .border({
          width: 3,
          color: Color.Yellow,
          style: BorderStyle.Solid
        })
        .padding({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })
        .borderRadius({
          topLeft: 10,
          topRight: 0,
          bottomLeft: 0,
          bottomRight: 10
        })
        .backgroundColor(Color.Orange)
      Image($r('app.media.startIcon'))
        .width(50)
        .borderRadius(50)
      Text('今天还没打卡')
        .height(40)
        .border({
          width: {   //利用对象形式设置单独一边
            bottom: 1
          },
          color: Color.Black,
          style: BorderStyle.Solid
        })
        .borderRadius(20)
        .padding(10)
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