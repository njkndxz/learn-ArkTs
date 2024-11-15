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
    Column() {
      Row() {
        Column({ space: 10 }) {
          Text('玩一玩')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('签到兑礼 | 超多大奖 超好玩')
            .fontColor(Color.Gray)
            .fontSize(14)
        }
        .alignItems(HorizontalAlign.Start)
        Row({ space: 10 }) {
          Image($r('app.media.startIcon'))
            .width(40)
          Image($r('app.media.ic_gallery_create'))
            .width(20)
            .fillColor('#999')
        }
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')
      .height(90)
      .backgroundColor('#fff')
      .borderRadius(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor(Color.Gray)
  }
}