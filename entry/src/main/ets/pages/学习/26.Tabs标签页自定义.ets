import { window } from '@kit.ArkUI';


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

  @State selectedIndex: number = 0

  @Builder
  myBuilder(itemIndex: number, title: string, img: ResourceStr, selImg: ResourceStr) {
    // 如果激活的是自己, 图片/文本 都需要调整样式 → 需要区分不同的 tabBar
    Column() {
      Image(itemIndex == this.selectedIndex ? selImg : img)
        .width(30)
      Text(title)
        .fontColor(itemIndex == this.selectedIndex ? Color.Red : Color.Black)
    }
  }

  @Builder
  centerBuilder() {
    Image($r('app.media.startIcon'))
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Text('购物车内容')
      }
      .tabBar(this.myBuilder(0, '购物车', $r('app.media.ic_tabbar_icon_2'), $r('app.media.ic_tabbar_icon_2_selected')))

      TabContent() {
        Text('活动内容')
      }
      .tabBar(this.centerBuilder())

      TabContent() {
        Text('我的内容')
      }
      .tabBar(this.myBuilder(2, '我的', $r('app.media.ic_tabbar_icon_3'), $r('app.media.ic_tabbar_icon_3_selected')))
    }
    .onChange((index: number) => {
      // console.log('激活的索引', index)
      this.selectedIndex = index
    })
    .animationDuration(0)
    .scrollable(false)
  }

}