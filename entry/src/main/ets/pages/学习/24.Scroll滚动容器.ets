import { window } from '@kit.ArkUI';





@Entry
@Component
struct Index {

  windowClass?: window.Window
  // 1.创建scroller对象
  scroller: Scroller = new Scroller()

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
    Column({ space: 10 }) {
      //2.绑定Scroll容器
      Scroll(this.scroller) {
        Column() {
          ForEach(new Array(6).fill(0), () => {
            Text()
              .width('100%')
              .height(100)
              .backgroundColor(Color.Orange)
              .margin(5)
          })
        }
        .padding(10)
        .width('100%')
      }
      .width('100%')
      .height(400)
      // 横向滚动，默认纵向
      .scrollable(ScrollDirection.Vertical)
      // 设置滚动条是否显示隐藏，默认是Auto
      .scrollBar(BarState.Auto)
      // 设置滚动条颜色
      .scrollBarColor(Color.Blue)
      // 设置滚动条宽度
      .scrollBarWidth(5)
      // 设置滑动到边缘的效果
      .edgeEffect(EdgeEffect.Spring)
      .onScroll((x, y) => {
        console.log('已经滑动的距离：', this.scroller.currentOffset().yOffset)
      })

      Button('获取滚动距离')
        .onClick(() => {
          const x = this.scroller.currentOffset().xOffset
          const y = this.scroller.currentOffset().yOffset
          AlertDialog.show({
            message: `滚动距离: ${x}，${y}`
          })
        })

      Button('回到顶部')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Top)
        })
    }
    .padding(10)
  }

}