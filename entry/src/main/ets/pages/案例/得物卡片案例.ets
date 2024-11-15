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
      Column() {
        Image($r('app.media.background'))
          .width('100%')
          .objectFit(ImageFit.Cover)
          .borderRadius({
            topLeft: 5,
            topRight: 5
          })
        Text('今晚吃这个 | 每日艺术分享 No.43')
          .fontWeight(600)
          .fontSize(14)
          .lineHeight(22)
          .height(60)
        Row() {
          Row({ space: 5 }) {
            Image($r('app.media.ic_gallery_create'))
              .width(18)
              .fillColor('#999')
            Text('插画师分享聚集地')
              .fontSize(12)
              .fontColor('#999')
          }
          .layoutWeight(1)
          Row({ space: 5 }) {
            Image($r('app.media.ic_gallery_create'))
              .width(18)
              .fillColor('#999')
            Text('2300')
              .fontSize(10)
              .fontColor('#999')
          }
        }
        .padding(10)
      }
      .width(200)
      .backgroundColor('#fff')
      .borderRadius(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#ccc')
  }
}