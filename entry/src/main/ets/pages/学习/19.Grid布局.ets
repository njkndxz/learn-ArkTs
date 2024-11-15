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
      // Grid布局
      Grid() {
        ForEach(new Array(12).fill(0), () => {
          GridItem() {
            Column() {

            }
            .width(80)
            .height(80)
            .backgroundColor(Color.Green)
            .border({width:1})
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      // 控制间距
      .columnsGap(5)
      .rowsGap(5)
      .width('100%')
      .height(500)
      .backgroundColor(Color.Pink)


      //角标组件
      Badge({
        count:1,
        position: BadgePosition.RightTop,
        style: {
          badgeSize: 16,
          fontSize: 12,
          badgeColor: Color.Red
        }
      }) {
        Image($r('app.media.bg_01'))
          .width(100)
      }

    }
    .width('100%')
    .height('100%')
    .padding(10)
  }

}