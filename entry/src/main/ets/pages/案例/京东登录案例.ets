import { window } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';
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
      Row() {
        Image($r('app.media.ic_gallery_create'))
          .width(20)
        Text('帮助')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Image($r('app.media.startIcon'))
        .width(250)
        .margin({
          top: 20,
          bottom: 20
        })

      Row() {
        Text('国家地址')
          .layoutWeight(1)
          .fontColor('#666')
        Text('中国(+86)')
          .margin({ right: 5 })
          .fontColor('#666')
        Image($r('app.media.ic_gallery_create'))
          .width(20)
          .fillColor('#666')
      }
      .width('100%')
      .height(40)
      .backgroundColor('#fff')
      .borderRadius(20)
      .padding({
        left: 15,
        right: 10
      })

      TextInput({
        placeholder: '请输入手机号'
      })
        .height(40)
        .borderRadius(20)
        .backgroundColor('#fff')
        .margin({ top: 20 })

      Row() {
        Checkbox()
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .width(15)
        // Text可以包裹Span，单独定制文本
        Text() {
          Span('我已经阅读并同意')
          Span('《京东隐私政策》').fontColor('#3274f6')
          Span('《京东用户协议》').fontColor('#3274f6')
          Span('未注册的手机号将自动创建')
        }
        .fontSize(12)
        .fontColor('#666')
        .lineHeight(20)
      }
      .alignItems(VerticalAlign.Top)
      .margin({ top: 20 })

      Button('登录')
        .width('100%')
        .backgroundColor('#bf2838')
        .margin({ top: 25 })

      Row({ space: 10 }) {
        Text('新用户注册').fontSize(14)
        Text('账号密码登录').fontSize(14)
        Text('无法登录').fontSize(14)
      }
      .margin({ top: 15 })
      // 填充组件，会自适应
      Blank()

      Column() {
        Text('其他登录方式')
          .height(22)
          .fontSize(14)
          .margin({ bottom: 28 })
          .fontColor('#666')
        Row() {
          Image($r('app.media.startIcon'))
            .width(34)
          Image($r('app.media.startIcon'))
            .width(34)
            .fillColor('#56a44')
          Image($r('app.media.startIcon'))
            .width(34)
            .fillColor('#c8493b')
          Image($r('app.media.startIcon'))
            .width(34)
            .fillColor('#4ba8e8')
        }
        .width('100%')
        .margin({
          bottom: 30
        })
        .justifyContent(FlexAlign.SpaceAround)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#ccc')
    // .backgroundImage($r('app.media.background'))
    .backgroundImageSize(ImageSize.Cover)
  }
}