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
      Column() {
        Text('VIP')
          .width(40)
          .height(20)
          .fontSize(14)
          .fontColor(Color.Yellow)
          .fontStyle(FontStyle.Italic)
          .textAlign(TextAlign.Center)
          .border({
            width: 2,
            color: Color.Yellow,
            style: BorderStyle.Solid
          })
          .borderRadius({
            topLeft: 10,
            bottomRight: 10
          })
          .backgroundColor(Color.Orange)
          .position({x:0, y:0})
          .zIndex(1)

        Image($r('app.media.position_moco'))
          .width('100%')
          .height(210)
          .borderRadius(10)

        Row() {
          Image($r('app.media.position_earphone'))
            .width(20)
            .backgroundColor('#55b7f4')
            .borderRadius(10)
            .padding(3)
            .fillColor(Color.White)
          Text('飞狗MOCO')
            .fontWeight(700)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .height(30)
        .padding({
          left: 10
        })
      }
      .width(160)
      .height(240)
      .backgroundColor(Color.White)
      .shadow(ShadowStyle.OUTER_DEFAULT_LG)
      .margin(10)
    }
    .width('100%')
    .height('100%')
  }
}