
import { router, window } from '@kit.ArkUI'

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
  // 组件只能用aboutToAppear和aboutToDisappear，页面还可以使用onPageShow和onPageHide
  // 组件被创建时
  aboutToAppear(): void {
  }

  // 组件被销毁时
  aboutToDisappear(): void {
  }

  // 对返回键进行监听
  onBackPress(): boolean | void {
    router.back()
    return true
  }


  build() {
    Column({ space: 10 }) {

    }
    .height('100%')
    .width('100%')
  }
}
