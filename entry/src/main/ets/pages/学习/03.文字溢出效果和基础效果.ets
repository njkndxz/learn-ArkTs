

@Entry
@Component
struct Index {
  @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    Column() {
      Text('学鸿蒙，就来黑马~')
        .fontSize(20)
        .width('100%')
        .height(40)
        .lineHeight(40)
        .padding(10)
      Row() {
        Text('置顶')
          .fontColor('#df3c50')
          .margin(5)
        Text('新华社')
          .fontColor(Color.Gray)
          .margin(5)
        Text('4680评论')
          .fontColor(Color.Gray)
          .margin(5)
      }
      .width('100%')
      .padding(10)
      Column() {
        Text('HarmonyOS开发初体验')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .lineHeight(50)
          .width('100%')
        Text('方舟开发框架(简称ArkUI)为HarmonyOS开发初体验的UI开发提供了完整的基础设施，包括简洁的UI语法，和丰富的UI')
          .fontColor(Color.Gray)
          .lineHeight(24)
            // 下面两个属性必须配合才可以做文本溢出显示
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(2)
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
  }
}