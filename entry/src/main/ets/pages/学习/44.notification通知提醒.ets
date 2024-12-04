
import { notificationManager } from '@kit.NotificationKit';
import { Prompt } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { WantAgent, wantAgent } from '@kit.AbilityKit';


interface ProgressData {
  progressValue: number;
  progressMaxValue: number;
}

interface Progress {
  name: string;
  data: ProgressData;
}

@Entry
@Component
struct Index {
  // 全局id
  idx: number = 0
  // 图像
  pixel: PixelMap = null!   //加!表示该值不会为null

  wantAgentInstance: WantAgent = null!

  async aboutToAppear() {
    // 获取资源管理器
    let rm = getContext(this).resourceManager;
    // 读取图片
    let file = await rm.getMediaContent($r('app.media.bz_img'))
    // 创建PixelMap
    image.createImageSource(file.buffer).createPixelMap()
      .then(value => this.pixel = value)
      .catch((e: Error) => console.log('加载图片异常', JSON.stringify(e)))

    // 2.创建拉取当前应用的行为意图
    // 2.1.创建wantInfo信息
    let wantInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: 'com.example.myapplication',  // 跳转到哪个应用
          abilityName: 'EntryAbility', // 跳转到应用下的哪个ability
        }
      ],
      requestCode: 0,
      operationType: wantAgent.OperationType.START_ABILITY,
      wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
    }
    // 2.2.创建wantAgent实例
    this.wantAgentInstance = await wantAgent.getWantAgent(wantInfo)

  }

  private publish(request: notificationManager.NotificationRequest) {
    notificationManager.publish(request)
      .then(() => {
        // 发布通知
        Prompt.showToast({
          message: '发布通知消息成功',
          duration: 2000
        })
      })
      .catch((err: Error) => {
        Prompt.showToast({
          message: `发布通知失败，失败原因：${err.message}`,
          duration: 2000
        })
      })
  }

  // 正常通知
  publishNormalTextNotification() {
    const request: notificationManager.NotificationRequest = {
      id: this.idx++,
      wantAgent: this.wantAgentInstance,
      content: {
        // contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '通知标题' + this.idx,
          text: '通知主要内容详情',
          additionalText: '通知附加内容'
        }
      },
      showDeliveryTime: true,
      deliveryTime: new Date().getTime(),
      groupName: 'myapp',
      // slotType: notificationManager.SlotType.SERVICE_INFORMATION
    }
    this.publish(request)
  }

  // 长文本通知
  publishLongTextNotification() {
    const request: notificationManager.NotificationRequest = {
      id: this.idx++,
      wantAgent: this.wantAgentInstance,
      content: {
        // contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
        longText: {
          title: '通知标题' + this.idx,
          text: '通知主要内容详情',
          additionalText: '通知附加内容',
          briefText: '通知概要和总结',
          expandedTitle:'通知展开时的标题' + this.idx,
          longText: '通知中的长文本，我很长，我很长，我很长，我很长，我很长，我很长，我很长',
        }
      },
      showDeliveryTime: true,
      deliveryTime: new Date().getTime(),
      groupName: 'myapp',
    }
    this.publish(request)
  }

  // 多行文本通知
  publishMultiLineNotification() {
    const request: notificationManager.NotificationRequest = {
      id: this.idx++,
      wantAgent: this.wantAgentInstance,
      content: {
        // contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
        multiLine: {
          title: '通知标题' + this.idx,
          text: '通知主要内容详情',
          additionalText: '通知附加内容',
          briefText: '通知概要和总结',
          longTitle: '通知中的长文本，我很长，我很长，我很长，我很长，我很长，我很长，我很长的标题',
          lines: [
            '第一行',
            '第二行',
            '第三行',
            '第四行',
          ]
        }
      },
      showDeliveryTime: true,
      deliveryTime: new Date().getTime(),
      groupName: 'myapp',
    }
    this.publish(request)
  }

  // 图片通知
  publishPictureNotification() {
    const request: notificationManager.NotificationRequest = {
      id: this.idx++,
      wantAgent: this.wantAgentInstance,
      content: {
        // contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: '通知标题' + this.idx,
          text: '通知主要内容详情',
          additionalText: '通知附加内容',
          briefText: '通知概要和总结',
          expandedTitle:'通知展开时的标题' + this.idx,
          picture: this.pixel
        }
      },
      showDeliveryTime: true,
      deliveryTime: new Date().getTime(),
      groupName: 'myapp',
    }
    this.publish(request)
  }

  // 进度条通知
  async publishProgressNotification() {
    // 准备进度条模板的参数
    const template: notificationManager.NotificationTemplate = {
      name: 'downloadTemplate',
      data: {
        progressValue: 60,
        progressMaxValue: 100 // 最大进度值
      }
    }
    // 判断当前系统是否支持进度条模板
    const isSupport = await notificationManager.isSupportTemplate(template.name)
    if(!isSupport) {
      return
    }

    const request: notificationManager.NotificationRequest = {
      id: this.idx++,
      template: template, // 进度条模板参数
      wantAgent: this.wantAgentInstance, // 行为意图参数
      content: {
        // contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '文件下载：xxxx.pdf',
          text: '下载进度',
          additionalText: template.data.progressValue.toString()
        }
      }
    }

    this.publish(request)
  }

  build() {
    Column({space: 20}) {

      Button(`发送normalText通知`)
        .onClick(() => this.publishNormalTextNotification())
      Button(`发送longText通知`)
        .onClick(() => this.publishLongTextNotification())
      Button(`发送multiLine通知`)
        .onClick(() => this.publishMultiLineNotification())
      Button(`发送Picture通知`)
        .onClick(() => this.publishPictureNotification())
      Button(`发送Progress通知`)
        .onClick(() => this.publishProgressNotification())
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#f1f2f3')
  }
}