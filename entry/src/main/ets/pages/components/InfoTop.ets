
@Extend(Button)
function fancyButton (isOn: boolean) {
  .width(46)
  .height(32)
  .fontSize(12)
  .padding({ left: 5, right: 5 })
  .backgroundColor(isOn ? '#fff' : '#F7F8FA')
  .fontColor(isOn ? '#2f2e33' : '#8e9298')
  .border({ width: 1, color: isOn ? '#e4e5e6' : '#F7F8FA' })
}





@Component
struct InfoTop {

  @State isOn: boolean = true

  onSortComment = (type: number) => {}

  build() {
    Row() {
      Text('全部评论')
        .fontColor('#222')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row() {
        Button('最新', { stateEffect: false })
          .fancyButton(this.isOn)
          .onClick(() => {
            this.isOn = true
            this.onSortComment(0)
          })
        Button('最热', { stateEffect: false })
          .fancyButton(!this.isOn)
          .onClick(() => {
            this.isOn = false
            this.onSortComment(1)
          })
      }
      .backgroundColor('#f7f8fa')
      .borderRadius(20)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(16)
    .border({
        width: {
          bottom: 1
        },
      color: '#e6e6e6'
    })
  }
}

export default InfoTop