import { window } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';
  windowClass?: window.Window
  // 如何解决DevEco预览器上下白色间距问题及实现全屏沉浸式体验, 可以通过调用鸿蒙的API来修复这个问题
  // this.windowClass.setWindowLayoutFullScreen(true) 这段代码会在页面加载时获取最后一个窗口并将其设为全屏模式，从而消除上下白色间距。
  async setFullScreen(flag: boolean) {
    if (!this.windowClass) {
      this.windowClass = await window.getLastWindow(getContext(this))
    }
    this.windowClass.setWindowLayoutFullScreen(flag)
  }

  onPageShow(): void {
    this.setFullScreen(true)
  }

  onPageHide(): void {
    this.setFullScreen(false)
  }


  build() {
    // 单行单列优先选择线性布局
    Column() {
      Text('阶段选择')
        .fontSize(30)
        .fontWeight(700)
        .padding(15)
      Flex({
        direction: FlexDirection.Row,
        // justifyContent: FlexAlign.SpaceAround,
        // alignItems: ItemAlign.Stretch
        wrap: FlexWrap.Wrap
      }) {
        Text('ArkUI')
          .margin(5)
          .padding(10)
          .backgroundColor('#f1f1f1')
        Text('ArkTs')
          .margin(5)
          .padding(10)
          .backgroundColor('#f1f1f1')
        Text('界面开发')
          .margin(5)
          .padding(10)
          .backgroundColor('#f1f1f1')
        Text('系统能力')
          .margin(5)
          .padding(10)
          .backgroundColor('#f1f1f1')
        Text('权限控制')
          .margin(5)
          .padding(10)
          .backgroundColor('#f1f1f1')
        Text('元服务')
          .margin(5)
          .padding(10)
          .backgroundColor('#f1f1f1')
      }
      .width('100%')
      .padding(20)
      // .backgroundColor('#ccc')
    }
  }
}