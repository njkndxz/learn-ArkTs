import { window } from '@kit.ArkUI';


interface Articles {
  title: string
  createTime: string
}

@Entry
@Component
struct Index {

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


  @State articles: Articles[] = [
    {
      title: '如何解决DevEco预览器上下白色间距问题及实现全屏沉浸式体验, 可以通过调用鸿蒙的API来修复这个问题',
      createTime: '2024-11-06 12:01:55'
    },
    {
      title: '如何解决DevEco预览器上下白色间距问题及实现全屏沉浸式体验, 可以通过调用鸿蒙的API来修复这个问题',
      createTime: '2024-11-06 12:01:55'
    },
    {
      title: '如何解决DevEco预览器上下白色间距问题及实现全屏沉浸式体验, 可以通过调用鸿蒙的API来修复这个问题',
      createTime: '2024-11-06 12:01:55'
    }
  ]

  build() {
    Column() {
      ForEach(this.articles, (item: Articles, index: number) => {
        Column({space: 10}) {
          Text(item.title)
            .width('100%')
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .maxLines(2)
            .fontSize(14)
          Text(item.createTime)
            .width('100%')
            .fontColor(Color.Gray)
            .fontSize(12)
        }
        .width('100%')
        .padding({
          top: 15,
          bottom: 15,
          left: 10,
          right: 10
        })
        .height(100)
        .justifyContent(FlexAlign.SpaceAround)
        .borderRadius(10)
        .shadow(ShadowStyle.OUTER_DEFAULT_MD)
        .margin({
          bottom: 10
        })
      })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }

}