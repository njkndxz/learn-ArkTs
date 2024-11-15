import { window } from '@kit.ArkUI'







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

  build() {
    Column(){

      // 列表组件
      List() {
        ForEach(Array.from({length: 20}), () => {
          ListItem() {
            Row() {

            }
            .width('100%')
          }
          .padding(10)
        })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      // .lanes(3, 5) //调整列数和间距
      // .alignListItem(ListItemAlign.Center) // 列对齐方式
      // .listDirection(Axis.Horizontal) //主轴方向
      .divider({
        strokeWidth: 2, //线宽
        color: '#e6e6e6', // 颜色
        startMargin: 10, // 左边间隙
        endMargin: 10 // 右边间隙
      })
    }
    .width('100%')
    .padding(10)
  }
}