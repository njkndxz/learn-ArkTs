import { CommentData } from '../modal/CommentData'


@Component
struct InfoItem {

  @ObjectLink itemObj: CommentData
  handleLike = () => {}

  build() {
    ListItem() {
      Column() {
        // 1. 头像，名字，等级
        Row() {
          Image(this.itemObj.avatar)
            .width(30)
            .aspectRatio(1)
            .margin({top: 10})
            .borderRadius(15)
          Text(this.itemObj.name)
            .fontSize(13)
            .fontColor(Color.Gray)
            .margin({ top: 10, left: 8 })
          Image(this.itemObj.levelIcon)
            .width(13)
            .aspectRatio(1)
            .margin({ top: 10, left: 8 })
            .borderRadius(15)
        }
        // 2.评论内容
        Text(this.itemObj.commentTxt)
          .fontSize(13)
          .fontColor(Color.Black)
          .margin({ left: 40, top: 10, bottom: 10})
        // 评论日期和点赞互动
        Row() {
          Text(this.itemObj.timeString)
            .fontSize(11)
            .fontColor(Color.Gray)
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .maxLines(3)
          Row({ space: 5 }) {
            Image(this.itemObj.isLike ? $r('app.media.ic_love') : $r('app.media.ic_lingdang'))
              .width(11)
              .aspectRatio(1)
            Text(this.itemObj.likeNum.toString())
              .fontSize(11)
              .fontColor(this.itemObj.isLike ? Color.Red : Color.Gray)
          }
          .onClick(() => {
            this.handleLike()
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .padding({
          left: 40,
          top: 5
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .padding(10)
  }
}

export default InfoItem