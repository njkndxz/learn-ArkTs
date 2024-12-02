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


  build() {
    Column({ space: 10 }) {

    }
    .width('100%')
    .height('100%')
  }
}