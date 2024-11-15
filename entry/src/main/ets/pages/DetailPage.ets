import router from '@ohos.router';

interface ParamsObj {
  msg: string
}

@Entry
@Component
struct DetailPage {
  @State msg: string = ''
  aboutToAppear(): void {
    // 获取路由参数
    const params = router.getParams() as ParamsObj
    this.msg = params.msg
  }

  build() {
    Column({ space: 10 }) {
      Text('详情页')
        .fontSize(50)
      Text('获取到传过来的参数: ' + this.msg)
      Button('返回')
        .onClick(() => {
          router.back()
        })
      Button('跳转到首页')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Index',
          })
        })
      Button('替换为首页')
        .onClick(() => {
          router.replaceUrl({
            url: 'pages/Index'
          })
        })
      Button('获取页面栈长度')
        .onClick(() => {
          AlertDialog.show({
            message: router.getLength()
          })
        })
      Button('清空页面栈')
        .onClick(() => {
          router.clear()
          AlertDialog.show({
            message: '页面栈已清空',
            autoCancel: true,
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}