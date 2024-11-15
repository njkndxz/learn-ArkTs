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
  /*
   * 注意:
   *  1. 普通变量只能在初始化时渲染，后续变化了也不会引起更新
   *  2. 状态变量，被装饰器修饰，值改变后会引起更新
   * */
  // 组件内的普通变量
  msg: string = '你好，这是个弹框'
  // 组件内的状态变量
  @State message: string = '点我显示弹框'

  build() {
    Column() {
      Button(this.message)
        .onClick(() => {
          // 修改状态变量
          this.message = '被点击过了'
          AlertDialog.show({
            message: this.message
          })
        })
      Button(this.msg)
        .onClick(() => {
          // 修改普通变量
          this.msg = 'hello'
          AlertDialog.show({
            message: this.msg
          })
        })
    }
    .width('100%')
  }

}