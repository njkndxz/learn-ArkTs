// 自定义组件
@Preview //可以预览
@Component
struct MyCom {
  // 成员变量 - 数据
  title: string = '默认的大标题'
  extra: string = '查看更多 >'
  // 成员变量 - 函数 - 可以外部传入覆盖的
  getMore = () => {
    AlertDialog.show({
      message: '查看更多'
    })
  }

  // 成员函数 - 不可以外部传入覆盖
  sayHi() {
    AlertDialog.show({
      message: '打招呼, 你好'
    })
  }

  build() {
    Column() {
      Row() {
        Text(this.title).fontSize(18)
        Text(this.extra).fontSize(18)
          .onClick(() => {
            this.getMore()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Row() {
        Text('内容部分').fontSize(18)
        Button('按钮')
          .onClick(() => {
            this.sayHi()
          })
      }
      .padding(20)
    }
    .padding(10)
    .width('100%')
    .height(200)
    .margin({ bottom: 20 })
    .borderRadius(10)
    .backgroundColor(Color.White)
  }
}

export default MyCom