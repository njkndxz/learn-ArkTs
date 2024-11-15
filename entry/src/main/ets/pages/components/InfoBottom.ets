@Component
struct InfoBottom {
  @State txt: string = ''
  onSubmitComment = (content: string) => {}

  build() {
    Row({ space:5 }) {
      Row() {
        Text('\ue840')
          .fontFamily('myFont')
          .fontSize(18)
          .margin({ left: 20 })
        TextInput({
          placeholder: '写评论...',
          text: $$this.txt    // $$代表双向绑定
        })
          .onSubmit(() => {
            this.onSubmitComment(this.txt)
            this.txt = ''
          })
          .backgroundColor(Color.Transparent)
          .fontSize(18)
      }
      .height(40)
      .backgroundColor('#f5f6f5')
      .borderRadius(20)
      .margin({
        left: 15,
        right: 20,
        top: 10,
        bottom: 10
      })
      .layoutWeight(1)
      Text('\ue600')
        .fontFamily('myFont')
        .fontSize(26)
      Text('\ue61d')
        .fontFamily('myFont')
        .fontSize(26)
    }
    .height(60)
    .width('100%')
    .border({
      width: {
        top: 1
      },
      color: '#ffefefef'
    })
  }
}

export default InfoBottom