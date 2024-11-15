

@Entry
@Component
struct Index {
  @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    Column() {
      Image('https://www.itheima.com/images/logo.png')
        .width(200)
      Image($r('app.media.startIcon'))
        .width(50)
        .margin(10)
      Text('随便写一些文字')
        .width(200)
      Row() {
        Image($r('app.media.startIcon'))
          .width(20)
          .margin(10)
        Text('又是一些文字')
      }
      .width(200)
    }
    .padding(10)
  }
}