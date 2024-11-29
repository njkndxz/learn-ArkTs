import PreferencesUtil from '../../common/utils/PreferencesUtil'



/*
 * 使用首选项存储数据
 * 1、导包preferences，创建PreferencesUtil工具类
 * 2、需要在entryability中加载preferences
 * 3、使用PreferencesUtil工具类
 * */

@Entry
@Component
struct Index {

  @Provide fontSize: string | number | null | undefined = 14
  @State outSetValueOne: number = 14

  async aboutToAppear(): Promise<void> {
    // this.loadShopInfo()
    this.fontSize = await PreferencesUtil.getPreferenceValue('myapp', 'IndexFontSize', 20)
    console.log('字体大小: ',this.fontSize)
  }


  build() {
    Column({ space: 10 }) {
      Text('哈哈哈哈')
        .fontSize(this.fontSize)
      Slider({
        value: this.outSetValueOne,
        min: 5,
        max: 100,
        style: SliderStyle.OutSet
      })
        .onChange((value: number, mode: SliderChangeMode) => {
          this.outSetValueOne = value
          this.fontSize = value
          PreferencesUtil.putPreferenceValue('myapp', 'IndexFontSize', value)
          console.info('value:' + value + 'mode:' + mode.toString())
        })

    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}