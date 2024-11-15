import { window } from '@kit.ArkUI';


@Component
struct SonCom {

  // 1.定义构建函数，类似插槽，接受外部传入ui，并设置默认值
  @BuilderParam
  ContentBuilder: () => void = this.defaultBuilder

  @Builder
  defaultBuilder() {
    Text('默认内容')
  }

  build() {
    Column() {
      //2.使用@BuilderParam装饰的成员变量
      this.ContentBuilder()
    }
  }
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

  build() {
    Column() {
      SonCom()
        // 给整个自定义组件添加属性和方法
        .onClick(() => {
          AlertDialog.show({
            message: '测试点击'
          })
        })

      SonCom() {
        // 直接传递进来(尾随闭包)，但是只能用于有一个BuidlerParam
        Button('待付款')
      }
    }
  }

}