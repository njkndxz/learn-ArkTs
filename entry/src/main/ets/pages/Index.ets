
import { router, window } from '@kit.ArkUI'
import { common, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'


// 从一个Ability中唤起另一个Ability，一个应用下两个窗口
/*
 *1. 准备want作为启动参数UIAbility
 * 2. 利用context startAbility 调起UIAbility
 * */
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

  //获取上下文对象
  context = getContext(this) as common.UIAbilityContext

  build() {
    Column({ space: 10 }) {
      Button('唤起另一个Ability')
        .onClick(() => {
          // 1.准备want(参数信息)
          let wantInfo: Want = {
            deviceId: '', //空表示本设备
            bundleName: '', //包名
            moduleName: 'entry', //模块名
            abilityName: 'twoEntryAbility',
            parameters: {
              info: '来着entryAbility'
            }
          }
          // 2. 利用context startAbility 调起UIAbility
          //返回一个promise对象
          this.context.startAbility(wantInfo)
            .then(() => {
              console.log('启动成功');
            })
            .catch((e: BusinessError) => {
              console.log('启动失败', e);
            })
        })
        Button('跨模块唤起另一个Ability')
          .onClick(() => {
            // 1.准备want(参数信息)
            let wantInfo: Want = {
              deviceId: '', //空表示本设备
              bundleName: "com.example.myapplication", //包名
              moduleName: 'twoEntry', //模块名
              abilityName: 'entryAbility',
              parameters: {
                info: '来自模块entry的entryAbility'
              }
            }
            // 2. 利用context startAbility 调起UIAbility
            //返回一个promise对象
            this.context.startAbility(wantInfo)
              .then(() => {
                console.log('启动成功');
              })
              .catch((e: BusinessError) => {
                console.log('启动失败', e);
              })
          })
    }
    .height('100%')
    .width('100%')
  }
}
