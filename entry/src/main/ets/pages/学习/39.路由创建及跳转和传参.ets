// import router from '@ohos.router'
// 上面和下面导入方式都可以
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {

  // 新建页面需要@Entry修饰，还要在main_pages.json注册
  // 页面栈，最大容量32个页面
  build() {
    Column({ space: 10 }) {
      Text('首页')
        .fontSize(20)
      Button('跳转到详情页')
        .onClick(() => {
          // Single路由模式，会将页面栈中相同的替换掉，默认路由模式是Standard
          router.pushUrl({
            url: 'pages/DetailPage',
            params: {
              msg: '传递一个参数'
            }
          }, router.RouterMode.Single)
        })
      Button('替换为详情页')
        .onClick(() => {
          router.replaceUrl({
            url: 'pages/DetailPage'
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
            autoCancel: true
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}
