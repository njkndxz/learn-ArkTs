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
        Stack({ alignContent: Alignment.Bottom }) {
          Image($r('app.media.bz_img'))
            .borderRadius({
              topLeft: 10,
              topRight: 10
            })
          Row() {
            Row({ space:5 }) {
              Image($r('app.media.ic_gallery_create'))
                .width(14)
                .fillColor(Color.White)
              Text('2888万')
                .fontColor(Color.White)
                .fontSize(12)
            }
            .margin({
              right: 10
            })
            Row({ space:5 }) {
              Image($r('app.media.ic_gallery_create'))
                .width(14)
                .fillColor(Color.White)
              Text('8655')
                .fontColor(Color.White)
                .fontSize(12)
            }

            Blank()

            Text('4:33')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('100%')
          .height(24)
          .padding({
            left: 5,
            right: 5
          })
        }
        .width('100%')
        .height(125)

        Column() {
          Text('方舟开发框架(简称ArkUI)为HarmonyOS开发初体验的UI开发提供了完整的基础设施，包括简洁的UI语法，和丰富的UI')
            .fontSize(13)
            .lineHeight(16)
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .maxLines(2)

          Row() {
            Text('19万点赞')
              .fontSize(10)
              .fontColor('#e66c43')
              .backgroundColor('#fef0ef')
              .padding(5)
              .borderRadius(2)
            Image($r('app.media.ic_gallery_create'))
              .width(14)
          }
          .margin({
            top: 6
          })
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .padding(5)


      }
      .width(200)
      .height(200)
      .borderRadius(10)
      .margin({top: 10})
      .shadow(ShadowStyle.OUTER_DEFAULT_LG)
    }
    .width('100%')
    .height('100%')
  }

}