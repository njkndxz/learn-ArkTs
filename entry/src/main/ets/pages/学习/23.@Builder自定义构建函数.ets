import { window } from '@kit.ArkUI';


/*
@Extend(组件名)
function 函数名() {}
* */
@Extend(Text)
function textFn() {
  .width('100%')
  .textAlign(TextAlign.Center)
  .fontSize(20)
  .fontWeight(FontWeight.Bold)
}


@Extend(Text)
function bannerItem(bgColor: ResourceColor, msg: string) {
  .width('100%')
  .textAlign(TextAlign.Center)
  .fontSize(20)
  .fontWeight(FontWeight.Bold)
  .backgroundColor(bgColor)
  .onClick(() => {
    AlertDialog.show({
      message: msg
    })
  })
}

/*
 * 1. 全局定义 不支持传参
 * */
@Styles function commonStyles() {
  .width(100)
  .height(100)
  .aspectRatio(1) // 设置宽高比例为1
}

//  1. 全局builder
@Builder
function navItem(icon: ResourceStr, txt: string) {
  Column({space: 10}) {
    Image(icon)
      .width('80%')
    Text(txt)
  }
  .width('25%')
  .onClick(() => {
    AlertDialog.show({
      message: '点了' + txt
    })
  })
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

  @State bgColor: ResourceColor = Color.Pink
  // 组件内定义 也不支持传参
  @Styles setBg() {
    .backgroundColor(this.bgColor)
    .onClick(() => {
      this.bgColor = Color.Blue
    })
  }

  //  2. 局部builder
  @Builder
  navItem2(icon: ResourceStr, txt: string) {
    Column({space: 10}) {
      Image(icon)
        .width('80%')
      Text(txt)
    }
    .width('25%')
    .onClick(() => {
      AlertDialog.show({
        message: '点了' + txt
      })
    })
  }


  build() {
    Column({ space: 10 }) {
      Swiper() {
        Text('1')
          .bannerItem(Color.Blue, '轮播图1')
        Text('2')
          .bannerItem(Color.Green, '轮播图2')
        Text('3')
          .bannerItem(Color.Orange, '轮播图3')
      }
      .autoPlay(true) // 开启自动播放
      .width('100%')
      .height(100)
      .backgroundColor(Color.Pink)
      .loop(true) // 开启循环
      .interval(5000) // 设置时间
      .vertical(false) // 是否纵向

      Text()
        .commonStyles()
        .setBg()

      Text()
        .commonStyles()
        .setBg()

      Text()
        .commonStyles()
        .setBg()

      navItem($r('app.media.zfb_tab_me'), 'me')
      this.navItem2($r('app.media.zfb_tab_chat'), 'chat')
    }
    .width(200)
    .padding(10)

  }

}