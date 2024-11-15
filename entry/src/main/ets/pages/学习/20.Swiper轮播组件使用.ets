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
      // Swiper轮播组件
      // 1. 包内容
      // 2. 设尺寸
      Swiper() {
        Text('1')
          .width('100%')
          .textAlign(TextAlign.Center)
        Text('2')
          .width('100%')
          .textAlign(TextAlign.Center)
        Text('3')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .autoPlay(true) // 开启自动播放
      .width('100%')
      .height(100)
      .backgroundColor(Color.Pink)
      .loop(true) // 开启循环
      .interval(5000) // 设置时间
      .vertical(false) // 是否纵向

      Swiper() {
        Image($r('app.media.xm'))
          .objectFit(ImageFit.Contain)
        Image($r('app.media.pg'))
          .objectFit(ImageFit.Contain)
        Image($r('app.media.hw'))
          .objectFit(ImageFit.Contain)
      }
      .aspectRatio(1) // 设置和图片一致的宽高比，保证图片适配
      .width('100%')
      .height(300)
      .autoPlay(true)
      .interval(4000)
      // 自定义小圆点
      .indicator(
        Indicator.dot()
          .itemWidth(10)
          .color(Color.Gray)
          .selectedItemWidth(30)
          .selectedColor(Color.White)
      )
    }
    .width('100%')
    .padding(10)

  }

}